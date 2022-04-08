#!/bin/bash

if [ ! -e ~/.zprofile ]
then
  printf "You not even have a zprofile file! All done here!\n\n"
fi

if  [[ $(command grep -il "git commit" ~/.zprofile) = "" ]]
then
  printf "Cant find git shortcuts... All done here!\n\n"
fi

printf "Removing git shortcuts..."
sed -i '' '/Git Shortcuts/d' ~/.zprofile
sed -i '' '/git status/d' ~/.zprofile
sed -i '' '/git add/d' ~/.zprofile
sed -i '' '/git diff/d' ~/.zprofile
sed -i '' '/git commit/d' ~/.zprofile
sed -i '' '/git checkout/d' ~/.zprofile
sed -i '' '/git pull/d' ~/.zprofile
printf "Git Shortcuts are gone\n\n"
