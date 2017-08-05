export ZSH=$HOME/.oh-my-zsh

#Themes
ZSH_THEME="geometry/geometry"

~/.scripts/check_updates_dotfiles.sh

#Plugins
plugins=(git github docker)

#Oh my zsh
source $ZSH/oh-my-zsh.sh

#Use user-local global npm packages
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

#Set GOPATH
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin"

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
