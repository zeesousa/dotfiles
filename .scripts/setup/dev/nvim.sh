#!/bin/bash

if [[ $(apt-cache search --names-only 'neovim' | wc -c) == 0 ]]; then 
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
fi

sudo apt-get install -y neovim
git clone https://github.com/VundleVim/Vundle.vim ~/.config/nvim/bundle/Vundle.vim
