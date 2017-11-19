#!/bin/bash

sudo apt-get install -y git curl zlib1g-dev build-essential \
    libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
    libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties \
    libffi-dev openjdk-8-jdk openjdk-8-doc software-properties-common\
    libgdbm-dev libncurses5-dev automake \
    libtool bison libffi-dev libpq-dev libssl-dev \
    cowsay

#fix internet
sudo touch /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
