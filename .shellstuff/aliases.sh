# packages
alias aptgrade="sudo apt update && sudo apt upgrade"

# ls
alias ls="ls --color=auto"
alias ll="ls -l"
alias lla="ls -la"
alias la="ls -A"
alias l="ls -CF"

alias llkb="ls -l --block-size=k"
alias llMB="ls -l --block-size=M"
alias llGB="ls -l --block-size=G"

# grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"

# fzf
alias fzfvim="fzf --bind 'enter:become(nvim {})'"
alias fzfoku="fzf --bind 'enter:become(okular {})'"

# dotfiles: from https://www.atlassian.com/git/tutorials/dotfiles
alias dotgit="/usr/bin/git --git-dir=$HOME/.dotfilegit --work-tree=$HOME"

alias bat="batcat"
alias cd="z"
