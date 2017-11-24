#!/usr/bin/env zsh

CURRENT_TIMESTAMP=$(date +"%s")
if [[ "$OSTYPE" == darwin* ]]; then
 LAST_FETCH_TIMESTAMP=$(stat -f '%m' $HOME/.yadm/repo.git/FETCH_HEAD) 
fi
if [[ "$OSTYPE" == "linux-gun" ]]; then
 LAST_FETCH_TIMESTAMP=$(stat -c %Y $HOME/.yadm/repo.git/FETCH_HEAD)
fi
DIFF_TIMESTAMP=`expr $CURRENT_TIMESTAMP - $LAST_FETCH_TIMESTAMP`

# Only check for updates every 12 hours

if [ $DIFF_TIMESTAMP -le "0" ]; then
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
