#!/bin/bash

function arch(){
  sudo pacman -S neovim
}

function ubuntu(){
  if [[ $(apt-cache search --names-only 'neovim' | wc -c) == 0 ]]; then
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
  fi

  sudo apt-get install -y neovim
}

function macos(){
  brew install nvim
}

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  if [ -x "$(command -v pacman)" ]; then
    arch
  elif [ -x "$(command -v apt-get)" ]; then
    ubuntu
  else
    echo "Unsupported distro! Exiting..."

    exit -1
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  macos
fi

git clone https://github.com/VundleVim/Vundle.vim ~/.config/nvim/bundle/Vundle.vim
nvim +PluginInstall +qall
