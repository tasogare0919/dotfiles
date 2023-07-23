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

# コマンドミスを修正
setopt correct

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

export EDITOR=vim

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


#alias
alias vi='vim'

# git prompt
autoload -Uz vcs_info
setopt prompt_subst
## vcs_info_msg_0_変数をどのように表示するかフォーマットの指定  %b: ブランチ名
zstyle ':vsc_info:git:*' formats '%b'
precmd () { vcs_info }
export PROMPT='[%D %* %K{250} %F{016}%C%k%K{118}%f%F{250} %f%F{016}%{${vcs_info_msg_0_}%f%k%F{118} %f]'

# git のカラー表示
git config --global color.ui auto

# git ailias
alias g='git'
alias gs='git status'
alias gb='git branch'



ZSH_THEME="candy"
export PATH=$PATH:~/.bin

