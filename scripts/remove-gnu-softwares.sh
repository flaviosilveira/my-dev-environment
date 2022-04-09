#!/bin/bash

brew --version > /dev/null 2>&1

if [ $? -eq 0 ]
then
  if  [[ $(command brew ls | grep gnu-sed) != "" ]]
  then
    printf "Removing gnu-sed (via Homebrew)..\n"
    brew remove --force gnu-sed
    printf "gnu-sed (via Homebrew) was removed!\n\n"
  else
    printf "Looks like gnu-sed (via Homebrew) is not installed.. Everything good here!\n\n"
  fi
else
  printf "Brew is necessary here.... skipping...\n\n"
fi
