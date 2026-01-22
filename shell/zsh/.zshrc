HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
bindkey -v

zstyle :compinstall filename '/home/luna/.zshrc'

autoload -Uz compinit
compinit

clear
fastfetch --config ~/.config/fastfetch/config.jsonc
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/tokyo.omp.json)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

source ~/.shellstuff/path.sh
source ~/.shellstuff/aliases.sh

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
	tmux new-session
fi

eval "$(zoxide init zsh)"
