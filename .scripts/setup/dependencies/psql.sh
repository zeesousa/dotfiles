#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

sudo apt-get install -y postgresql libpq-dev

sudo cp $DIR/pg_hba.conf /etc/postgresql/9.6/main/pg_hba.conf 
sudo service postgresql restart
sudo runuser postgres -c "createuser jose -s"

