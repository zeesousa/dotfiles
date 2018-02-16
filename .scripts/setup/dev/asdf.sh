#!/bin/zsh

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.2

source ~/.zshrc

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get install automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc gpg
fi

asdf plugin-add ruby
asdf plugin-add nodejs

export GNUPGHOME="${ASDF_DIR:-$HOME/.asdf}/keyrings/nodejs" && mkdir -p "$GNUPGHOME" && chmod 0700 "$GNUPGHOME"
~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf install ruby "2.4.2"
asdf install nodejs "8.9.4"

asdf global ruby "2.4.2"
asdf global nodejs "8.9.4"

source ~/.zshrc

ruby -v
node -v
