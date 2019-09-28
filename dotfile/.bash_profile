export CLICOLOR=1

export LSCOLORS=GxFxCxDxBxegedabagaced

alias py='python'
alias ..='cd ..'

# 'ls'家族 (假定使用GNU ls)
alias la='ls -Al'               # 显示隐藏文件
alias ls='ls -hF -G'            # 为识别的文件类型添加颜色
alias lr='ls -lR'               # 递归ls
alias lm='ls -al |more'         # 管道给'more'
alias ll='ls -l'
