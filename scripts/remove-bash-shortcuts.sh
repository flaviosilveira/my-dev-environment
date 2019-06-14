#!/bin/bash

if [ ! -e ~/.bash_profile ]
then
  printf "You not even have a bash_profile file! All done here!\n\n"
fi

if  [[ $(command grep -il "ls -l" ~/.bash_profile) = "" ]]
then
  printf "Cant find bash shortcuts... All done here!\n\n"
fi

printf "Removing Bash shortcuts..."
sed -i '' '/Bash Shortcuts/d' ~/.bash_profile
sed -i '' '/ls -l/d' ~/.bash_profile
sed -i '' '/vim/d' ~/.bash_profile
printf "Bash Shortcuts are gone\n\n"
