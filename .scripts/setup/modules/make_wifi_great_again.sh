#!/bin/sh

sudo sed -i 's/wifi.powersave = 3/wifi.powersave = 2/' /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
sudo systemctl restart network-manager.service

sudo modprobe -r iwlwifi
sudo modprobe iwlwifi 11n_disable=8
