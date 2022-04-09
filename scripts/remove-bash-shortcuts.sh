#!/bin/bash

printf "Removing Bash shortcuts..."

if [ ! -e ~/.zprofile ]
then
  printf "You not even have a zprofile file! All done here!\n\n"
  exit 0
fi

if  [[ $(command grep -il "ls -l" ~/.zprofile) = "" ]]
then
  printf "Cant find Z shortcuts... All done here!\n\n"
fi

sed -i '' '/Z Shortcuts/d' ~/.zprofile
sed -i '' '/ls -l/d' ~/.zprofile
sed -i '' '/vim/d' ~/.zprofile
printf "Z Shortcuts are gone\n\n"
