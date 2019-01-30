#!/bin/bash

if  [[ $(command brew ls | grep grep) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have Grep (via Homebrew) installed!\nUse -f as last parameter to force an update!\n\n" 
else
  if [[ $(command brew ls | grep grep) != "" ]]
  then
    printf "Upgrading Grep (via Homebrew) version...\n"
    brew upgrade grep
    printf "Grep (via Homebrew) is up to date!\n"
  else
    printf "Installing Grep (via Homebrew) version...\n"
    brew install grep
    printf "Grep (via Homebrew) installed!\n"
  fi
fi

if  [[ $(command brew ls | grep gnu-sed) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have Gnu-sed (via Homebrew) installed!\nUse -f as last parameter to force an update!\n\n" 
else
  if [[ $(command brew ls | grep gnu-sed) != "" ]]
  then
    printf "Upgrading Gnu-sed (via Homebrew) version...\n"
    brew upgrade gnu-sed
    printf "Gnu-sed (via Homebrew) is up to date!\n"
  else
    printf "Installing Gnu-sed (via Homebrew) version...\n"
    brew install gnu-sed
    printf "Gnu-sed (via Homebrew) installed!\n"
  fi
fi
