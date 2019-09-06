#!/bin/bash

if [ ! -e ~/.bash_profile ]
then
  printf "Cant find .bash_profile file.. creating one..\n"
  touch ~/.bash_profile
  chmod 644 ~/.bash_profile
  printf ".bash_profile created!\n\n"
fi

if  [[ $(command grep -il "git commit" ~/.bash_profile) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Looks like you already have some git shortcuts in your bash profile..\nUse -f to remove them and re-add them.\n\n"
else

  if [[ $(command grep -il "git commit" ~/.bash_profile) != "" ]]
  then
    printf "Removing actual git shortcuts..."
    ./scripts/remove-git-shortcuts.sh
  fi

  printf "Creating shortcuts...\n"
  echo "" >> ~/.bash_profile
  echo "## Git Shortcuts ###" >> ~/.bash_profile
  echo "alias gs='git status'" >> ~/.bash_profile
  echo "alias ga='git add'" >> ~/.bash_profile
  echo "alias gd='git diff'" >> ~/.bash_profile
  echo "alias gc='git commit'" >> ~/.bash_profile
  printf "Shortcuts created!\n\n"

fi
