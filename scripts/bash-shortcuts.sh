#!/bin/bash

if [ ! -e ~/.zprofile ]
then
  printf "Cant find .bash_profile file.. creating one..\n"
  touch ~/.zprofile
  chmod 644 ~/.zprofile
  printf ".zprofile created!\n\n"
fi

if  [[ $(command grep -il "ls -l" ~/.zprofile) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Looks like you already have some bash shortcuts in your Z profile..\nUse -f to remove them and re-add them.\n\n"
else

  if [[ $(command grep -il "ls -l" ~/.zprofile) != "" ]]
  then
    printf "Removing actual bash shortcuts..."
    $PWD/scripts/remove-bash-shortcuts.sh
  fi

  printf "Creating shortcuts...\n"
  echo "" >> ~/.zprofile
  echo "## Z Shortcuts ###" >> ~/.zprofile
  echo "alias ll='ls -l'" >> ~/.zprofile
  echo "alias v='/opt/homebrew/bin/vim'" >> ~/.zprofile
  echo "alias composer='docker run --rm --interactive --tty --volume $PWD:/app composer'"
  echo "LC_ALL=en_US.UTF-8" >> ~/.zprofile
  echo "## Docker shortcuts ###" >> ~/.zprofile
  echo "alias dps='docker ps'" >> ~/.zprofile
  echo "alias dcu='docker compose up'" >> ~/.zprofile
  echo "alias dcd='docker compose down'" >> ~/.zprofile
  printf "Shortcuts created!\n\n"

fi
