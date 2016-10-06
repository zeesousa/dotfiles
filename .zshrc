export ZSH=/home/jose/.oh-my-zsh

ZSH_THEME="pygmalion"

plugins=(git bundler)

source $ZSH/oh-my-zsh.sh

alias update_system="sudo apt-get update && sudo apt-get upgrade"

