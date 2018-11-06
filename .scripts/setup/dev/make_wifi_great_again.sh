#!/bin/sh

function arch(){
  echo "MakeWifiGreatAgain not implemented!"
}

function ubuntu(){
  sudo sed -i 's/wifi.powersave = 3/wifi.powersave = 2/' /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
  sudo systemctl restart network-manager.service

  sudo modprobe -r iwlwifi
  sudo modprobe iwlwifi 11n_disable=8

  sudo touch /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
}

function macos(){
  echo "MakeWifiGreatAgain not implemented!"
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
