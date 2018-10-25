#!/bin/bash

function create_user(){
  DIR="$(dirname "$(readlink -f "$0")")"
  ORIGINAL_USER="$(echo $USER)"

  sudo cp $DIR/pg_hba.conf /etc/postgresql/10/main/pg_hba.conf
  sudo service postgresql restart
  sudo runuser postgres -c "createuser $ORIGINAL_USER -s"
}

function arch(){
  sudo pacman -S postgresql postgresql-libs

  create_user
}

function ubuntu(){
  sudo apt-get install -y postgresql libpq-dev

  create_user
}

function macos(){
  brew install postgresql
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
