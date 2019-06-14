#!/bin/bash

if  [[ $(command brew ls | grep ripgrep) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have Rip Grep installed!\nUse -f as last parameter to force an update!\n\n" 
else
  if [[ $(command brew ls | grep ripgrep) != "" ]]
  then
    printf "Upgrading RipGrep version...\n"
    brew upgrade ripgrep
    printf "RipGrep is up to date!\n"
  else
    printf "Installing RipGrep version...\n"
    brew install ripgrep
    printf "RipGrep installed!\n"
  fi
fi

if  [[ $(command brew ls | grep vim) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have Vim (via homebrew) installed!\nUse -f as last parameter to force an update!\n\n" 
else
  if [[ $(command brew ls | grep vim) != "" ]]
  then
    printf "Upgrading Vim (via homebrew) version...\n"
    brew upgrade ripgrep
    printf "Vim (via homebrew) is up to date!\n"
  else
    printf "Installing Vim (via homebrew) version...\n"
    brew install ripgrep
    printf "Vim (via homebrew) installed!\n"
  fi
fi
