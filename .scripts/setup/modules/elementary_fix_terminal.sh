#!/bin/bash

sudo apt-get install -y gnome-terminal

sudo apt-get purge -y pantheon-terminal

gsettings set org.gnome.desktop.default-applications.terminal exec gnome-terminal
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''

