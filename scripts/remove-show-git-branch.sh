#!/bin/bash

printf "Removing show git branch..."

if [ ! -e ~/.zprofile ]
then
  printf "You not even have a zprofile file! All done here!\n\n"
  exit 0
fi

if  [[ $(command grep -il "git commit" ~/.zprofile) = "" ]]
then
  printf "Cant find tricks to show git branch... All done here!\n\n"
fi

sed -i '' '/Show git branch/d' ~/.zprofile
sed -i '' '/parse_git_branch()/d' ~/.zprofile
sed -i '' '/git branch 2>/d' ~/.zprofile
sed -i '' '/}/d' ~/.zprofile
sed -i '' '/(parse_git_branch)/d' ~/.zprofile

printf "Show git branch are gone\n\n"
