#!/bin/bash

if [ ! -e ~/.bash_profile ]
then
  printf "You not even have a bash_profile file! All done here!\n\n"
fi

if  [[ $(command grep -il "git commit" ~/.bash_profile) = "" ]]
then
  printf "Cant find git shortcuts... All done here!\n\n"
fi

printf "Removing git shortcuts..."
sed -i '' '/Git Shortcuts/d' ~/.bash_profile
sed -i '' '/git status/d' ~/.bash_profile
sed -i '' '/git add/d' ~/.bash_profile
sed -i '' '/git commit/d' ~/.bash_profile
sed -i '' '/git push origin master/d' ~/.bash_profile
printf "Git Shortcuts are gone\n\n"
