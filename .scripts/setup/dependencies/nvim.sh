#!/bin/bash

sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y nvim
git clone github.com/VundleVim/Vundle.vim ~/.config/nvim/bundle/Vundle.vim
