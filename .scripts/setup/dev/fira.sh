#!/bin/bash

function arch(){
  wget https://github.com/carrois/Fira/archive/master.zip
  unzip master.zip
  sudo mkdir -p /usr/share/fonts/opentype/fira_code
  sudo mkdir -p /usr/share/fonts/opentype/fira_mono
  sudo mkdir -p /usr/share/fonts/opentype/fira_sans
  sudo cp FiraSans-master/Fira_Code_3_2/Fonts/FiraCode_OTF_32/* /usr/share/fonts/opentype/fira_code
  sudo cp FiraSans-master/Fira_Mono_3_2/Fonts/FiraMono_OTF_32/* /usr/share/fonts/opentype/fira_mono
  sudo cp FiraSans-master/Fira_Sans_4_3/Fonts/Fira_Sans_OTF_4301/Normal/Roman/* /usr/share/fonts/opentype/fira_sans
  sudo cp FiraSans-master/Fira_Sans_4_3/Fonts/Fira_Sans_OTF_4301/Normal/Italic/* /usr/share/fonts/opentype/fira_sans
  rm -rf master.zip Fira-master/
}

function ubuntu(){
  wget https://github.com/carrois/Fira/archive/master.zip
  unzip master.zip
  sudo mkdir -p /usr/share/fonts/opentype/fira_code
  sudo mkdir -p /usr/share/fonts/opentype/fira_mono
  sudo mkdir -p /usr/share/fonts/opentype/fira_sans
  sudo cp FiraSans-master/Fira_Code_3_2/Fonts/FiraCode_OTF_32/* /usr/share/fonts/opentype/fira_code
  sudo cp FiraSans-master/Fira_Mono_3_2/Fonts/FiraMono_OTF_32/* /usr/share/fonts/opentype/fira_mono
  sudo cp FiraSans-master/Fira_Sans_4_3/Fonts/Fira_Sans_OTF_4301/Normal/Roman/* /usr/share/fonts/opentype/fira_sans
  sudo cp FiraSans-master/Fira_Sans_4_3/Fonts/Fira_Sans_OTF_4301/Normal/Italic/* /usr/share/fonts/opentype/fira_sans
  rm -rf master.zip Fira-master/
}

function macos(){
  echo "Not implemented!"
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
