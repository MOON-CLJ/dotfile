# ls 颜色配置（macOS）
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdabagaced  # 目录蓝色加粗，链接紫色等

# 基础别名
alias py='python'
alias ..='cd ..'

# ls 家族
alias la='ls -A'               # 显示隐藏文件（不含 . 和 ..）
alias ll='ls -Al'              # 详细列表 + 隐藏文件
alias ls='ls -hF -G'           # human readable + 类型标记 + 颜色
alias lr='ls -lR'              # 递归
alias lm='la |more'            # 管道给 more