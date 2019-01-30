#!/bin/bash

if [ ! -e ~/.bash_profile ]
then
  printf "Cant find .bash_profile file.. creating one..\n"
  touch ~/.bash_profile
  chmod 644 ~/.bash_profile
  printf ".bash_profile created!\n\n"
fi

if  [[ $(command grep -il "ls -l" ~/.bash_profile) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Looks like you already have some bash shortcuts in your bash profile..\nUse -f to remove them and re-add them.\n\n"
else

  if [[ $(command grep -il "ls -l" ~/.bash_profile) != "" ]]
  then
    printf "Removing actual bash shortcuts..."
    ./scripts/remove-bash-shortcuts.sh
  fi

  printf "Creating shortcuts...\n"
  echo "" >> ~/.bash_profile
  echo "## Bash Shortcuts ###" >> ~/.bash_profile
  echo "alias ll='ls -l'" >> ~/.bash_profile
  printf "Shortcuts created!\n\n"

fi
