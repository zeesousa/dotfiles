#!/bin/bash

git clone https://github.com/frmendes/geometry

mkdir -p $HOME/.oh-my-zsh/custom/themes/
mv geometry/geometry.zsh $HOME/.oh-my-zsh/custom/themes/geometry.zsh-theme
mv geometry/lib $HOME/.oh-my-zsh/custom/themes/
mv geometry/plugins $HOME/.oh-my-zsh/custom/themes/

rm -rf geometry
