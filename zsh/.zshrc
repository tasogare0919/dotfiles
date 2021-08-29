# vscode jupyter
export PATH=$HOME/julia-1.5.3/bin/:$HOME/.nodebrew/current/bin:$PATH
# GitHub CLI
eval "$(gh completion -s zsh)"

# 自動補完
autoload -U compinit
compinit

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/sadayoshitada/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sadayoshitada/google-cloud-sdk/completion.zsh.inc'; fi

# snaqme setting
export DYNAMODB_TABLE=schema_migrations

eval "$(rbenv init -)"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@6/lib/pkgconfig"
alias ls='ls -G'

# tabtab source for packages
# uninstall by removing these lines
#[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# pyenv virtualenv setting
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#
alias ec2="aws ec2 describe-instances --query 'Reservations[].Instances[].{PublicDnsName:PublicDnsName,InstanceId:InstanceId,Tags:Tags[?Key==\`Name\`].Value|[0],InstanceType:InstanceType,State:State.Name}' --output table"

# peco setting
function peco-ec2 () {
  local host =$(ec2 | peco --query "$LBUFFER")
  aws ssm start-session --target "$host" --profile snaqme-prod
}

# fzf setting
export FZF_DEFAULT_OPTS='--color=fg+:11 --height 70% --reverse --select-1 --exit-0 --multi'

## aws-profile


## fzf-cdr

## psql
export PATH="/usr/local/opt/libpq/bin:$PATH"
source <(kubectl completion zsh)

export PATH="$HOME/.poetry/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sadayoshitada/sandbox-codes/k8s-hardway-sandbox/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sadayoshitada/sandbox-codes/k8s-hardway-sandbox/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sadayoshitada/sandbox-codes/k8s-hardway-sandbox/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sadayoshitada/sandbox-codes/k8s-hardway-sandbox/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Cellar/tfenv/2.2.0/versions/0.15.0/terraform terraform
eval "$(plenv init -)"
source ~/.perlbrew/etc/bashrc
