#!/bin/bash

echo -e "Installing misc stuff\n\n"
~/.scripts/setup/dev/misc.sh
echo -e "\n\n"

echo -e "Installing asdf vm\n\n"
~/.scripts/setup/dev/asdf.sh
echo -e "\n\n"

echo -e "Installing nvim\n\n"
~/.scripts/setup/dev/nvim.sh
echo -e "\n\n"

echo -e "Installing zsh\n\n"
~/.scripts/setup/dev/zsh.sh
echo -e "\n\n"

echo -e "Installing psql\n\n"
~/.scripts/setup/dev/psql.sh
echo -e "\n\n"

echo -e "Installing vscode packages\n\n"
~/.scripts/setup/dev/vscode_packages.sh
echo -e "\n\n"

echo -e "Installing fira fonts\n\n"
~/.scripts/setup/dev/fira.sh
echo -e "\n\n"

echo -e "Installing chromedriver\n\n"
~/.scripts/setup/dev/chrome_driver.sh
echo -e "\n\n"
