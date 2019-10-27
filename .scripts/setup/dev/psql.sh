#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

function create_user(){
  ORIGINAL_USER="$(echo $USER)"

  sudo runuser postgres -c "createuser $ORIGINAL_USER -s"
}

function arch(){
  sudo pacman -S postgresql postgresql-libs

  sudo su - postgres -c "initdb --locale en_US.UTF-8 -D '/var/lib/postgres/data'"

  sudo systemctl start postgresql
  sudo cp $DIR/pg_hba.conf /etc/postgresql/10/main/pg_hba.conf
  sudo cp $DIR/pg_hba.conf /etc/postgresql/11/main/pg_hba.conf
  sudo systemctl restart postgresql

  create_user
}

function ubuntu(){
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - 
  sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" > /etc/apt/sources.list.d/PostgreSQL.list'
    
  sudo apt-get update
  sudo apt-get install -y postgresql-11 pgadmin4 libpq-dev

  sudo cp $DIR/pg_hba.conf /etc/postgresql/10/main/pg_hba.conf
  sudo cp $DIR/pg_hba.conf /etc/postgresql/11/main/pg_hba.conf
  sudo service postgresql restart

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
