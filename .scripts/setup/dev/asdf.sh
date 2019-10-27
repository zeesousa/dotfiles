#!/bin/zsh

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.1

source ~/.zshrc

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  if [ -x "$(command -v pacman)" ]; then
    sudo pacman -S --noconfirm base-devel
  elif [ -x "$(command -v apt-get)" ]; then
    sudo apt-get install -y automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev curl
    
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

    sudo apt update && sudo apt install --no-install-recommends -y yarn
  else
    echo "Unsupported distro! Exiting..."

    exit -1
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc gpg
fi

asdf plugin-add ruby
asdf plugin-add nodejs

export GNUPGHOME="${ASDF_DIR:-$HOME/.asdf}/keyrings/nodejs" && mkdir -p "$GNUPGHOME" && chmod 0700 "$GNUPGHOME"
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf install ruby "2.6.5"
asdf install nodejs "12.13.0"

asdf global ruby "2.6.5"
asdf global nodejs "12.13.0"

source ~/.zshrc

ruby -v
node -v
