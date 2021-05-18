# Path to your oh-my-zsh installation.
export ZSH="/Users/anuragrawat/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# repo - https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(
	git
	zsh-autosuggestions
	vscode
      	sudo
	history
	web-search
	extract
	osx
	copydir
	copyfile
	vi-mode
)

source $ZSH/oh-my-zsh.sh

# repo - https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source /Users/anuragrawat/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# For a full list of active aliases, run `alias`.
alias zshconfig="open ~/.zshrc"
alias ohmyzsh="open ~/.oh-my-zsh"
alias paths="echo $PATH | tr ':' '\n'"
alias update="source .zshrc"

# Spotify CLI alias
alias spplay="spotify play"
alias sppause="spotify pause"
alias spn="spotify next"
alias spp="spotify previous"
alias spurl="spotify share url"
alias spq="spotify quit"

# Vi-mode configs
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{yellow}+%f"

# Recursively remove .DS_Store files
alias removeds="find . -type f -name '*.DS_Store' -ls -delete"


# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}


# To update oh my zsh, run `omz update`
