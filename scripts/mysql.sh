#!/bin/bash

if  [[ $(command brew ls | grep mysql) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have Mysql (via Homebrew) installed!\nUse -f as last parameter to force an update!\n\n" 
else
  if [[ $(command brew ls | grep mysql) != "" ]]
  then
    printf "Upgrading Mysql (via Homebrew) version...\n"
    brew upgrade mysql
    printf "Mysql (via Homebrew) is up to date!\n"
  else
    printf "Installing Mysql (via Homebrew) version...\n"
    brew install mysql
    printf "Mysql (via Homebrew) installed!\n"
  fi
fi
