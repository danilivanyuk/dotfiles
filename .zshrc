if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Eza (better ls) -----

alias ls="eza --icons=always"

# ---- Aliases ----

# Commands
alias n="nvim"
alias n.="nvim ."
alias venv="source venv/bin/activate "
alias py="python"
alias pm="python3 main.py"

# Folders
alias w="cd ~/Work"
alias wai="cd ~/Work/aiMachine"
alias wal="cd ~/Work/alpacaMeet"
alias wf="cd ~/Work/front"

# Folders nvim open
alias nwaid="nvim ~/Work/aiMachine/dev"
alias nwaif="nvim ~/Work/aiMachine/feature"
alias nwald="nvim ~/Work/alpacaMeet/dev"
alias nwalf="nvim ~/Work/alpacaMeet/feature"
alias nwfd="nvim ~/Work/front/dev"
alias nwff="nvim ~/Work/front/feature"
