#!/bin/sh

# misc
brew install hub git zsh yadm curl wget coreutils automake \
  autoconf openssl libyaml readline libxslt libtool unixodbc \
  gpg nvim
brew tap caskroom/fonts
brew cask install visual-studio-code slack spotify discord \
  chromedriver postgresql font-fira-code font-fira-mono \
  font-fira-mono-for-powerline font-fira-sans

# zsh
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.5
source ~/.zshrc
asdf update
asdf plugin-add ruby
asdf plugin-add nodejs
export GNUPGHOME="${ASDF_DIR:-$HOME/.asdf}/keyrings/nodejs" && mkdir -p "$GNUPGHOME" && chmod 0700 "$GNUPGHOME"
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install ruby "2.6.5"
asdf install nodejs "12.13.0"
asdf global ruby "2.6.5"
asdf global nodejs "12.13.0"
