#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  if [ -x "$(command -v pacman)" ]; then
    sudo pacman -S zsh
  elif [ -x "$(command -v apt-get)" ]; then
    sudo apt-get install -y zsh
  else
    echo "Unsupported distro! Exiting..."

    exit -1
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install zsh
fi

git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

source ~/.zshrc
