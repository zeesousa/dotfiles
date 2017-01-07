#!/bin/sh

UPSTREAM=${1:-'@{u}'}
LOCAL=$(yadm rev-parse @)
REMOTE=$(yadm rev-parse "$UPSTREAM")
BASE=$(yadm merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "Your dotfiles are up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "You need to update your dotfiles\nRun 'yadm pull'"
elif [ $REMOTE = $BASE ]; then
    echo "You need to push your changes to github\nRun 'yadm push'"
else
    echo "Your dotfiles diverged. You need to merge local and remote changes"
fi
