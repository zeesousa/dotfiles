export ZSH=$HOME/.oh-my-zsh

#Themes
ZSH_THEME="geometry/geometry"

~/.scripts/check_updates_dotfiles.sh

#Plugins
plugins=(git github docker)

#Oh my zsh
source $ZSH/oh-my-zsh.sh

#Set GOPATH
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

#My aliases

alias update_system="sudo apt-get update && sudo apt-get upgrade"
alias bi="bundler install"
alias be="bundler exec"
alias rake="bundle exec rake"
alias gpr="hub pull-request"
alias rdcm="rake db:drop && rake db:create && rake db:migrate"
alias git="hub"

export PATH="$PATH:$HOME/.scripts/git"

#Phoenix aliases
alias mec="mix ecto.create"
alias med="mix ecto.drop"
alias mem="mix ecto.migrate"

#RVM setup
export PATH="$PATH:$HOME/.rvm/bin"

GEOMETRY_PROMPT_PREFIX="%F{$GEOMETRY_COLOR_DIR}$USER@$HOST"

source ~/.rvm/scripts/rvm

#paranoid android
export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
