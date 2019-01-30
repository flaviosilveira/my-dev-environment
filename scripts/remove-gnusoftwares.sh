#!/bin/bash

if  [[ $(command brew ls | grep grep) != "" ]]
then
  printf "Removing grep (via Homebrew)..\n"
  brew remove --force grep
  printf "grep (via Homebrew) was removed!\n\n"
else
  printf "Looks like grep (via Homebrew) is not installed.. Everything good here!\n\n"
fi

if  [[ $(command brew ls | grep gnu-sed) != "" ]]
then
  printf "Removing gnu-sed (via Homebrew)..\n"
  brew remove --force gnu-sed
  printf "gnu-sed (via Homebrew) was removed!\n\n"
else
  printf "Looks like gnu-sed (via Homebrew) is not installed.. Everything good here!\n\n"
fi
