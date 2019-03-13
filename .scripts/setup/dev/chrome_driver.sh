#!/bin/bash

function arch(){
  pacaur -S chromedriver
}

function ubuntu(){
  sudo apt-get install -y chromium-chromedriver
  sudo ln -s /usr/lib/chromium-browser/chromedriver /usr/bin/chromedriver
}

function macos(){
  brew cask install chromedriver
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
