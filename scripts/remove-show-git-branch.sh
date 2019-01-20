#!/bin/bash

if [ ! -e ~/.bash_profile ]
then
  printf "You not even have a bash_profile file! All done here!\n\n"
fi

if  [[ $(command grep -il "git commit" ~/.bash_profile) = "" ]]
then
  printf "Cant find tricks to show git branch... All done here!\n\n"
fi

printf "Removing show git branch..."
sed -i '' '/Show git branch/d' ~/.bash_profile
sed -i '' '/parse_git_branch()/d' ~/.bash_profile
sed -i '' '/git branch 2>/d' ~/.bash_profile
sed -i '' '/}/d' ~/.bash_profile
sed -i '' '/(parse_git_branch)/d' ~/.bash_profile
printf "Show git branch are gone\n\n"
