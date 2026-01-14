# my dotfile

vim: https://github.com/amix/vimrc

## Claude Skills 配置

用于配置 Claude Code 的自定义 skills。

### 使用方法

```bash
# 1. Clone skills 仓库到本地（选择其中一个）
# 方式一：使用 fork 后的仓库
git clone git@github.com:MOON-CLJ/skills.git ~/dev/skills

# 方式二：使用官方仓库
git clone git@github.com:anthropics/skills.git ~/dev/skills

# 2. 创建符号链接到 Claude 配置目录
ln -s ~/dev/skills/skills ~/.claude/skills
```

### 注意事项

- 如果 clone 到其他目录，请相应调整符号链接路径
- 确保已安装并配置好 Claude Code CLI

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
