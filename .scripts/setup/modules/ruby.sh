#!/bin/bash

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

source ~/.zshrc

rbenv install 2.4.2
rbenv global 2.4.2
