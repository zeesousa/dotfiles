#!/usr/bin/env zsh

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y git curl zlib1g-dev build-essential wget \
  libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
  libxml2-dev libxslt1-dev libcurl4-openssl-dev \
  libffi-dev openjdk-8-jdk openjdk-8-doc software-properties-common\
  libgdbm-dev libncurses5-dev automake \
  libtool bison libpq-dev libssl-dev \
  cowsay direnv file snapd firefox mongodb apt-transport-https \
  autoconf libreadline-dev libncurses-dev libssl-dev \
  libxslt-dev unixodbc-dev

# zsh
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# asdf
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install --no-install-recommends -y yarn
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

# brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
/home/linuxbrew/.linuxbrew/bin/brew install hub

# some snap apps
sudo snap install discord spotify

# elasticsearch
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update
sudo apt-get install -y elasticsearch

# psql
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee  /etc/apt/sources.list.d/pgdg.list
sudo apt-get update
sudo apt-get install -y postgresql-12 libpq-dev
sudo cp $0/misc/pg_hba.conf /etc/postgresql/12/main/pg_hba.conf
sudo service postgresql restart
ORIGINAL_USER="$(echo $USER)"
sudo runuser postgres -c "createuser $ORIGINAL_USER -s"

# keybase app
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install -y ./keybase_amd64.deb
rm -f keybase_amd64.deb

# vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install -y code
rm packages.microsoft.gpg

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

# nvim
if [[ $(apt-cache search --names-only 'neovim' | wc -c) == 0 ]]; then
  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo apt-get update
fi
sudo apt-get install -y neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
vim +PlugInstall +qall

# chromium
sudo add-apt-repository ppa:chromium-team/stable
sudo apt-get update
sudo apt-get -y chromium-chromedriver chromium-driver

# firefox-dev

wget -O firefox.tar.bz 'https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US'
tar xjf firefox.tar.bz
sudo mv firefox /usr/local/bin
sudo chown -R $USER /usr/local/bin/firefox
cat > ~/.local/share/applications/firefoxDeveloperEdition.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Firefox Developer Edition
Exec=/usr/local/bin/firefox/firefox
Icon=/usr/local/bin/firefox/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
Categories=Network;WebBrowser;Favorite;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; X-Ayatana-Desktop-Shortcuts=NewWindow;NewIncognitos;
EOL
rm -f firefox.tar.bz


echo "Please run chsh and select ZSH"
