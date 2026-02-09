HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000

bindkey -v

zstyle :compinstall filename '/home/luna/.zshrc'

autoload -Uz compinit
compinit

clear
source ~/.rcextras/path.sh
source ~/.rcextras/aliases.sh

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

function chpwd() {
	if [[ -e .chpwd.zsh.d ]]; then
		for f in .chpwd.zsh.d/*.sh; do
			source $f
		done
	fi
}
