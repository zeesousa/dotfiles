#!/bin/bash

git clone https://github.com/frmendes/geometry

mkdir -p $HOME/.oh-my-zsh/custom/themes/

cp -rf geometry $HOME/.oh-my-zsh/custom/themes

rm -rf geometry
