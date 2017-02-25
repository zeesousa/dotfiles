#!/bin/bash

sudo apt-get -y install golang

export GOPATH="$HOME/.go"

go get github.com/github/hub