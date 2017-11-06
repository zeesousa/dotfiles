#!/bin/bash

sudo apt-get install -y zsh
 sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed "s/env zsh//g")"

git clone https://github.com/frmendes/geometry
mkdir -p $HOME/.oh-my-zsh/custom/themes/
cp -rf geometry $HOME/.oh-my-zsh/custom/themes
rm -rf geometry

yadm checkout -- ~/.zshrc
env zsh
