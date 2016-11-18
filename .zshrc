export ZSH=/home/jose/.oh-my-zsh

#Themes
ZSH_THEME="pygmalion"

#Plugins
plugins=(git docker)

#Oh my zsh
source $ZSH/oh-my-zsh.sh

#Use user-local global npm packages
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

#Nice things for golang
export GOPATH="$HOME/.go"

#My aliases
alias update_system="sudo apt-get update && sudo apt-get upgrade"
alias bi="bundler install"

#RVM setup
export PATH="$PATH:$HOME/.rvm/bin"
