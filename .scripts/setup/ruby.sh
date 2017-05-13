#!/bin/bash

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install 2.4.0
rbenv global 2.4.0
ruby -v

