sudo apt-get install -y software-properties-common

# pretty stuff
sudo add-apt-repository -y ppa:noobslab/themes
sudo add-apt-repository -y ppa:noobslab/icons
sudo add-apt-repository -y ppa:moka/daily
sudo apt-get update && sudo apt-get install -y arc-theme arc-icons moka-icon-theme

# spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

# utils
sudo apt-get install -y evince pinta eog vlc transmission gdebi gedit tlp
