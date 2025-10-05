# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# bash history management
# See bash(1) for more options
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

clear
fastfetch --config ~/.config/fastfetch/config.jsonc

source ~/.shellstuff/py.sh
source ~/.shellstuff/path.sh
source ~/.shellstuff/aliases.sh
source ~/.shellstuff/pretty.sh
source ~/.shellstuff/util.sh

eval "$(zoxide init bash)"
