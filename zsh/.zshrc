export PATH="/usr/local/opt/mysql@8.0/bin:$PATH"
export PATH="$HOME/.gem/ruby/3.1.0/bin:$PATH"

# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
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

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
fi

PROMPT="%F{green}%n%f %F{cyan}($(arch))%f:%F{blue}%~%f$"

source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh


# GitHub CLI
eval "$(gh completion -s zsh)"

# 自動補完
autoload -U compinit
compinit

# ghq
export GO111MODULE=on
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

function peco-src(){
	local src=$(ghq list --full-path|peco --query "$LBUFFER")
	if [ -n "$src" ]; then
		BUFFER="cd $src"
		zle accept-line
	fi
	zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
#libpq
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export EDITOR=vim

#alias
alias vi='cursor'
alias la='ls -la'
alias lt='ls -lrt'

# git ailias
alias g='git'
compdef g=git

# gh alias
alias ghpr='gh pr list -s all -a tasogare0919'
gcre() {
    echo "Type repository name: " && read name;
    echo "Type repository description: " && read description;
    gh repo create ${name} --description ${description} --private
    git init && echo "# ${name}" > README.md && git add . && git status && git commit -m "First commit"
    git branch -M develop
    git remote add origin https://github.com/tasogare0919/${name}.git;
    git push -u origin develop;
}

ZSH_THEME="candy"
export PATH=$PATH:~/.bin

eval "$(gh completion -s zsh)"
eval "$(direnv hook zsh)"

export LDFLAGS="-L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/bzip2/include"
export PATH="/usr/local/opt/bzip2/bin:$PATH"
eval "$(rbenv init -)"
export GPG_TTY=$TTY

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
#source /Users/tady/.config/op/plugins.sh
#source ~/.config/op/plugins.sh
export PATH="/opt/homebrew/sbin:$PATH"

# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f$ '

# Flutter
export PATH=$PATH:/Users/tady/workspace/src/flutter/bin

# bun completions
[ -s "/Users/tady/.bun/_bun" ] && source "/Users/tady/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# starship
eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Rust
export PATH=$PATH:$HOME/.cargo/env


# Nix
# export DARWIN_USER=$(whoami)
# export DARWIN_HOST=$(hostname -s)
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
