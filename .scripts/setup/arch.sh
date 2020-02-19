#!/bin/bash

sudo pacman-mirrors --country Portugal United_Kingdom Sweden United_States && sudo pacman -Syyyu --noconfirm
gpg --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
sudo pacman -Sy pacaur

pacaur -Sy hub moka-icon-theme arc-gtk-theme yadm git zsh curl direnv wget \
  franz-bin slack-desktop visual-studio-code-bin snapd firefox elasticsearch \
  mongodb-bin chromedriver base-devel --noconfirm

# some snaps
sudo snap install discord spotify

# nvim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
vim +PlugInstall +qall

# psql
sudo su - postgres -c "initdb --locale en_US.UTF-8 -D '/var/lib/postgres/data'"
sudo systemctl start postgresql
sudo cp $0/misc/pg_hba.conf /etc/postgresql/12/main/pg_hba.conf
sudo systemctl restart postgresql
ORIGINAL_USER="$(echo $USER)"
sudo runuser postgres -c "createuser $ORIGINAL_USER -s"

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.5
.asdf/bin/asdf update
.asdf/bin/asdf plugin-add ruby
.asdf/bin/asdf plugin-add nodejs
export GNUPGHOME="${ASDF_DIR:-$HOME/.asdf}/keyrings/nodejs" && mkdir -p "$GNUPGHOME" && chmod 0700 "$GNUPGHOME"
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
.asdf/bin/asdf install ruby "2.6.5"
.asdf/bin/asdf install nodejs "12.13.0"
.asdf/bin/asdf global ruby "2.6.5"
.asdf/bin/asdf global nodejs "12.13.0"
.asdf/bin/asdf reshim ruby
.asdf/bin/asdf reshim nodejs
curl -o- -L https://yarnpkg.com/install.sh | bash


# fira fonts
wget https://github.com/carrois/Fira/archive/master.zip
unzip master.zip
sudo mkdir -p /usr/share/fonts/opentype/fira_code
sudo mkdir -p /usr/share/fonts/opentype/fira_mono
sudo mkdir -p /usr/share/fonts/opentype/fira_sans
sudo cp FiraSans-master/Fira_Code_3_2/Fonts/FiraCode_OTF_32/* /usr/share/fonts/opentype/fira_code
sudo cp FiraSans-master/Fira_Mono_3_2/Fonts/FiraMono_OTF_32/* /usr/share/fonts/opentype/fira_mono
sudo cp FiraSans-master/Fira_Sans_4_3/Fonts/Fira_Sans_OTF_4301/Normal/Roman/* /usr/share/fonts/opentype/fira_sans
sudo cp FiraSans-master/Fira_Sans_4_3/Fonts/Fira_Sans_OTF_4301/Normal/Italic/* /usr/share/fonts/opentype/fira_sans
rm -rf master.zip FiraSans-master/
