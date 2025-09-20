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

# replace cd with zoxide
alias cd="z"

# flatpaks
alias codium="flatpak run com.vscodium.codium"
alias gimp="flatpak run org.gimp.GIMP"
