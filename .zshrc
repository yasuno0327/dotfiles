# zsh configuration

#### Zsh plugins
export ZSH="/Users/yoshitomo.yasuno/.oh-my-zsh"
source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

export ZSH_THEME="awesomepanda"

autoload -U compinit
compinit

plugins=(
  git
  zsh-abbr
  zsh-completions
  zsh-autosuggestions
)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

#### Load path
export PATH=$PATH:$HOME/.nodebrew/current/bin
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

#### direnv
eval "$(direnv hook zsh)"

#### Ruby
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

#### Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$HOME/.local/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv rehash -)"

#### Aliases
abbr -S gc='git checkout'
abbr -S gcb='git checkout -b'
abbr -S gr='git reset'
abbr -S config_shell='nvim ~/.zshrc'
abbr -S source_rc='source ~/.zshrc'
abbr -S gp='git push origin $(git rev-parse --abbrev-ref HEAD)'
abbr -S config_vim='nvim $VIMRC'
abbr -S lg='lazygit'
abbr -S git-force-pull='git fetch && git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'
abbr -S stop_container='docker stop $(docker ps -a -q)'

