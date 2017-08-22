#!/bin/bash
sudo apt-get -y install golang-1.8

export GOPATH="$HOME/.go"

sudo add-apt-repository -y ppa:cpick/hub
sudo apt-get update
sudo apt-get install -y hub
