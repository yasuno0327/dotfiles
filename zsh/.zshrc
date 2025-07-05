# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# Tmux
if [[ -z "$NVIM" && -z $TMUX && -n $PS1 ]]; then
  TMUX_SESSION_NAME="tmux"
  tmux has-session -t $TMUX_SESSION_NAME &> /dev/null

  if [ $? != 0 ]; then
    tmux new-session -s $TMUX_SESSION_NAME
  else
    tmux attach-session
  fi
fi

export PATH=~/.local/bin:$PATH

# 一旦Amazon Qの補完機能を使ってみる
autoload -Uz compinit
compinit

# XDG Base Directory (Untached from default)
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# mise
eval "$($HOME/.local/bin/mise activate zsh)"

# ZINIT
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light olets/zsh-abbr
zinit light zsh-users/zsh-syntax-highlighting
# 一旦Amazon Qの補完機能を使ってみる
# zinit light zsh-users/zsh-autosuggestions
# zinit light zsh-users/zsh-completions
# zinit light zdharma/history-search-multi-word 

# Kubernetes
source <(kubectl completion zsh)

## java
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin
export PATH="/Applications/IntelliJ IDEA CE.app/Contents/plugins/maven/lib/maven3/bin:$PATH"
export MAVEN_OPTS="-Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true"

# Starship (Need put at end of file)
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
export STARSHIP_CACHE=$XDG_CACHE_HOME/starship/cache
eval "$(starship init zsh)"

# alias
abbr -S mine='cd ~/workspace/mine'
abbr -S gc='git checkout'
abbr -S gcb='git checkout -b'
abbr -S gr='git reset'
abbr -S git-branch-clean='git branch --merged | grep -Ev "(^\*|^\+|master|main|dev)" | xargs --no-run-if-empty git branch -d'
abbr -S config_shell='nvim ~/.zshrc'
abbr -S source_rc='source ~/.zshrc'
abbr -S gp='git push origin $(git rev-parse --abbrev-ref HEAD)'
abbr -S config_vim='nvim $VIMRC'
abbr -S lg='lazygit'
abbr -S git-force-pull='git fetch && git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'
abbr -S stop_container='docker stop $(docker ps -a -q)'

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
