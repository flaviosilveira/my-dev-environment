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
    printf "Grep (via Homebrew) installed!\n"
  fi
fi
