#!/bin/bash

function arch(){
  sudo pacman-mirrors --country Portugal United_Kingdom Sweden United_States && sudo pacman -Syyyu --noconfirm
  gpg --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
  pacaur -Sy hub moka-icon-theme arc-gtk-theme yadm git zsh curl direnv wget \
    franz-bin slack-desktop visual-studio-code-bin snapd firefox elasticsearch mongodb-bin --noconfirm
  sudo snap install discord spotify
}

function ubuntu(){
  sudo apt-get install -y git curl zlib1g-dev build-essential wget \
    libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
    libxml2-dev libxslt1-dev libcurl4-openssl-dev \
    libffi-dev openjdk-8-jdk openjdk-8-doc software-properties-common\
    libgdbm-dev libncurses5-dev automake \
    libtool bison libffi-dev libpq-dev libssl-dev \
    cowsay direnv file snapd firefox mongodb elasticsearch

  sudo snap install discord spotify

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

  brew install hub
}

function macos(){
  brew install hub git zsh yadm curl wget
  brew cask install visual-studio-code slack spotify discord
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
