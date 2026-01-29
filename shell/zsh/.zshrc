HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000

bindkey -v

zstyle :compinstall filename '/home/luna/.zshrc'

autoload -Uz compinit
compinit

clear
source ~/.shellstuff/path.sh
source ~/.shellstuff/aliases.sh

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
	tmux new-session
else
	fastfetch --config ~/.config/fastfetch/config.jsonc
	eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/tokyo.omp.json)"
fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init - zsh)"
eval "$(zoxide init zsh)"
