# 工具使用指南

本文档提供 Claude Code 使用各种工具的最佳实践和规范。

## LSP 工具使用规范

**第一次使用 LSP 工具前，务必先查看工具定义和参数要求**，避免因参数错误导致调用失败。

### 通用参数要求（所有 LSP 操作）

- `line`: 行号，**1-based**（从1开始计数）
- `character`: 字符位置，**1-based**（从1开始计数），指向符号首字符
- `filePath`: 文件绝对路径或相对路径

这些参数是 **LSP 协议本身的标准**，与具体的语言服务器实现无关（pyright-lsp、gopls-lsp 等都遵循此标准）。

### 使用注意事项

- **需要指定符号位置的操作**（如 `findReferences`、`goToDefinition`、`hover` 等）：必须先用 `Read` 工具读取文件，确认符号的准确行号和字符位置，再调用 LSP
- **不需要位置参数的操作**（如 `documentSymbol`、`workspaceSymbol` 等）：可直接调用，无需预先读取文件

### 使用策略

#### 少量 LSP 查询（1-5次）

直接在主对话中并行调用：

```python
# 一个消息中并行调用多次 LSP，提高效率
LSP(operation="findReferences", filePath="...", line=78, character=15)
LSP(operation="findReferences", filePath="...", line=26, character=15)
LSP(operation="goToDefinition", filePath="...", line=42, character=10)
```

**适合场景**：
- 已知确切位置的简单查询
- 查找特定方法的引用
- 快速查看符号定义

#### 大量 LSP 查询或复杂探索任务

使用 `Task` + `Explore` agent：

```python
Task(
  subagent_type="Explore",
  prompt="探索某个方法的完整调用链，找出所有调用入口和业务场景",
  # Explore agent 会自主决定使用 LSP findReferences 并向上追溯
)
```

**适合场景**：
- 探索完整调用链
- 理解代码架构
- 跨多文件的符号搜索
- 需要结合多种工具（LSP、Grep、Read）的复杂分析

**优势**：
- Explore agent 会自主选择最佳工具组合
- 可以进行多轮迭代分析
- 提供更完整的上下文和总结

### 常见错误

❌ **错误1**：不读取文件直接猜测字符位置
```python
# 错误：直接假设符号在第15列
LSP(operation="findReferences", filePath="...", line=78, character=15)
```

✅ **正确**：先用 Read 确认位置
```python
# 正确：先读取文件确认
Read("path/to/some_file.py")
# 从输出中确认方法名在第78行第15列
LSP(operation="findReferences", filePath="...", line=78, character=15)
```

❌ **错误2**：使用 0-based 索引
```python
# 错误：LSP 是 1-based，不是 0-based
LSP(operation="findReferences", filePath="...", line=77, character=14)
```

✅ **正确**：使用 1-based 索引
```python
# 正确：行号和字符位置都从1开始计数
LSP(operation="findReferences", filePath="...", line=78, character=15)
```

### 实战示例

#### 示例1：查找方法的所有引用

```python
# 1. 读取文件确认位置
Read("path/to/some_repository.py")

# 2. 确认方法名和位置（比如 delete_item 在第42行第10列）
# 3. 查找引用
LSP(operation="findReferences",
    filePath="path/to/some_repository.py",
    line=42,
    character=10)
# 结果：Found 8 references across 5 files
```

#### 示例2：探索完整调用链

```python
Task(
  subagent_type="Explore",
  prompt="""
  探索 path/to/some_repository.py 中所有写入方法的完整调用链路。
  需要分析：method_a, method_b, method_c

  对每个方法：
  - 使用 findReferences 找到所有引用
  - 向上追溯调用链，找出最终的调用入口
  - 总结业务场景
  """,
  # Explore agent 会自动使用 LSP + Read + Grep 组合分析
)
```

#### 示例3：查看符号的类型信息

```python
# 读取文件确认变量位置
Read("path/to/some_controller.py")

# 查看某个变量的类型
LSP(operation="hover",
    filePath="path/to/some_controller.py",
    line=30,
    character=12)
# 结果：显示类型信息、文档字符串等
```
