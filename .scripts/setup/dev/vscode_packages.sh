#!/bin/zsh

cat "$HOME/.vscode/extensions.list" | \
while read CMD; do
	code --install-extension $CMD
done
