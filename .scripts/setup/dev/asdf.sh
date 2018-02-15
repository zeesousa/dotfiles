#!/bin/zsh

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.2

source ~/.zshrc

sudo apt-get install automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev

asdf plugin-add ruby
asdf plugin-add nodejs

export GNUPGHOME="${ASDF_DIR:-$HOME/.asdf}/keyrings/nodejs" && mkdir -p "$GNUPGHOME" && chmod 0700 "$GNUPGHOME"
~/.asdf/plugins/nodejs/bin/import-release-team-keyring

