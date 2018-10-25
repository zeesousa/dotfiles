#!/bin/bash

echo "Installing misc stuff\n\n"
~/.scripts/setup/dev/misc.sh
echo "\n\n"

echo "Installing asdf vm\n\n"
~/.scripts/setup/dev/asdf.sh
echo "\n\n"

echo "Installing nvim\n\n"
~/.scripts/setup/dev/nvim.sh
echo "\n\n"

echo "Installing zsh\n\n"
~/.scripts/setup/dev/zsh.sh
echo "\n\n"

echo "Installing psql\n\n"
~/.scripts/setup/dev/psql.sh
echo "\n\n"

echo "Installing vscode packages\n\n"
~/.scripts/setup/dev/vscode_packages.sh
echo "\n\n"

echo "Installing fira fonts\n\n"
~/.scripts/setup/dev/fira.sh
echo "\n\n"

echo "Installing chromedriver\n\n"
~/.scripts/setup/dev/chrome_driver.sh
echo "\n\n"
