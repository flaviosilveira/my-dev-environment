#!/bin/bash

# Setting script permissin to execute
chmod +x scripts/*.sh

# Check parameters
if [ "$#" -lt 1 -o "$#" -gt 2 ]
then
  ./scripts/usage.sh
  exit
fi

# Checking second paramenter
if [ "$#" -eq 2 -a "$2" != "-f" ]
then
  printf "SetEnvironment: Second parameter unknow.\n"
fi

# There are some parameters, so lets check them
case $1 in

install) 

  if [ -e ~/.vimrc -a "$2" != "-f" ]
  then
    printf "You already have a .vimrc file in your home folder!\nUse -f to force an update! Use the --vimrc option if you just want to update the vimrc file.\n" 
  else
    ./scripts/vim-config.sh
  fi

;;

remove)
  printf "Removing...\n"
  # .vimrc
  rm -rf ~/.vimrc
  printf ".vimrc file removed!\n"
;;

*) 
  printf "SetEnvironment: $1 is not a SetEnvironment command.\n"
;;

esac
