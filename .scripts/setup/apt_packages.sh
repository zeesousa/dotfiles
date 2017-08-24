#!/bin/bash

sudo add-apt-repository -y ppa:cpick/hub
sudo apt-get update && sudo apt-get -y upgrade

# BUILD TOOLS AND UTILS
sudo apt-get install -y git vim curl zlib1g-dev build-essential \
    libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
    libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties \
    libffi-dev openjdk-8-jdk openjdk-8-doc \
    libgdbm-dev libncurses5-dev automake \
    libtool bison libffi-dev libpq-dev libssl-dev \
    cowsay hub
