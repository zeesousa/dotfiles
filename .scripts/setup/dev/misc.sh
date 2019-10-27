#!/bin/bash

function arch(){
  sudo pacman-mirrors --country Portugal United_Kingdom Sweden United_States && sudo pacman -Syyyu --noconfirm

  gpg --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

  pacaur -Sy hub moka-icon-theme arc-gtk-theme yadm git zsh curl direnv discord franz-bin mailspring slack-desktop visual-studio-code-bin spotify --noconfirm
}

function ubuntu(){
  sudo apt-get install -y git curl zlib1g-dev build-essential \
    libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
    libxml2-dev libxslt1-dev libcurl4-openssl-dev \
    libffi-dev openjdk-8-jdk openjdk-8-doc software-properties-common\
    libgdbm-dev libncurses5-dev automake \
    libtool bison libffi-dev libpq-dev libssl-dev \
    cowsay direnv
}

function macos(){
  echo "Misc packages not implemented!"
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
