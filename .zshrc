source ~/.zplug/init.zsh

zplug "sorin-ionescu/prezto"
zplug load

export GOPATH=$HOME/go
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.yarn/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export RAILS_ENV=development
eval "$(rbenv init -)"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
