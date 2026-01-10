# my dotfile

vim: https://github.com/amix/vimrc

## Shell 配置

macOS 现在默认使用 zsh，配置文件为 `dotfile/.zshrc`。

### 使用方法

```bash
# 创建符号链接到主目录
ln -s ~/dev/dotfile/dotfile/.zshrc ~/.zshrc

# 重新加载配置
source ~/.zshrc
```

### 主要功能

- `ls` 彩色输出（目录蓝色加粗）
- 常用别名：`la`（隐藏文件）、`ll`（详细列表）、`..`（返回上级目录）
