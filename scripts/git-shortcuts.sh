#!/bin/bash

if [ ! -e ~/.zprofile ]
then
  printf "Cant find .zprofile file.. creating one..\n"
  touch ~/.zprofile
  chmod 644 ~/.zprofile
  printf ".zprofile created!\n\n"
fi

if  [[ $(command grep -il "git commit" ~/.zprofile) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Looks like you already have some git shortcuts in your Z profile..\nUse -f to remove them and re-add them.\n\n"
else

  if [[ $(command grep -il "git commit" ~/.zprofile) != "" ]]
  then
    printf "Removing actual git shortcuts..."
    ./scripts/remove-git-shortcuts.sh
  fi

  printf "Creating shortcuts...\n"
  echo "" >> ~/.zprofile
  echo "## Git Shortcuts ###" >> ~/.zprofile
  echo "alias gs='git status'" >> ~/.zprofile
  echo "alias ga='git add'" >> ~/.zprofile
  echo "alias gd='git diff'" >> ~/.zprofile
  echo "alias gc='git commit'" >> ~/.zprofile
  echo "alias gp='git pull'" >> ~/.zprofile
  echo "alias gch='git checkout'" >> ~/.zprofile
  printf "Shortcuts created!\n\n"

fi
