#!/bin/bash

#update system
sudo apt-get update && sudo apt-get -y upgrade

#dependencies
sudo apt-get install -y git vim curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

#node
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

#yarn by facebook, a better alternative to npm
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update && sudo apt-get install -y yarn

#rails and ruby
cd
sudo apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.3.1
rvm use 2.3.1 --default
ruby -v

gem install bundler
gem install rails
gem install github

#java
sudo apt-get install -y openjdk-8-jdk openjdk-8-doc netbeans

#zsh
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc

#hub by github
sudo apt-get install golang

export GOPATH="$HOME/.go"

go get github.com/github/hub
