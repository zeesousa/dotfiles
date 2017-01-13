#!/bin/sh

CURRENT_TIMESTAMP=$(date +"%s")
LAST_FETCH_TIMESTAMP=$(stat -c %Y .yadm/repo.git/FETCH_HEAD)
DIFF_TIMESTAMP=`expr $CURRENT_TIMESTAMP - $LAST_FETCH_TIMESTAMP`

if [ $DIFF_TIMESTAMP -lt "0" ]; then
  :
elif [ $DIFF_TIMESTAMP -gt "43200" ]; then
  echo "Checking dotfiles for updates"
  yadm fetch origin
fi

UPSTREAM=${1:-'@{u}'}
LOCAL=$(yadm rev-parse @)
REMOTE=$(yadm rev-parse "$UPSTREAM")
BASE=$(yadm merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
  :
elif [ $LOCAL = $BASE ]; then
  echo "You need to update your dotfiles\nRun 'yadm pull'"
elif [ $REMOTE = $BASE ]; then
  echo "You need to push your changes to github\nRun 'yadm push'"
else
  echo "Your dotfiles diverged. You need to merge local and remote changes"
fi
