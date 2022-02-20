#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
typeset -U path PATH
path=(
    /opt/homebrew/bin(N-/)
    /usr/local/bin(N-/)
    $path
)
# GitHub CLI
eval "$(gh completion -s zsh)"

# 自動補完
autoload -U compinit
compinit

# ghq
export GO111MODULE=on
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

bindkey '^]' peco-src
function peco-src(){
	local src=$(ghq list --full-path|peco --query "$LBUFFER")
	if [ -n "$src" ]; then
		BUFFER="cd $src"
		zle accept-line
	fi
	zle -R -c
}
zle -N peco-src
#libpq
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"