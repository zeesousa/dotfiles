#!/bin/bash

sudo dconf dump / > ~/.scripts/dconf-settings
echo "Dconf settings dumped to ~/.scripts/dconf-settings"
