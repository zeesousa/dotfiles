export ZSH=/home/jose/.oh-my-zsh

#Themes
ZSH_THEME="pygmalion"

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
alias gpr="hub pull-request"
alias rdcm="rake db:drop && rake db:create && rake db:migrate"
alias git="hub"

#RVM setup
export PATH="$PATH:$HOME/.rvm/bin"
