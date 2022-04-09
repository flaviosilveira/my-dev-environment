#!/bin/bash

brew --version  > /dev/null 2>&1

if [ $? -eq 0 ]
then
  printf "Removing Homebrew.. Will Require Password..\n"
  curl -O https://raw.githubusercontent.com/Homebrew/install/master/uninstall
  chmod +x uninstall
  ./uninstall -f -q
  rm -rf ./uninstall
else
  printf "Looks like Homebrew is not installed.. Everything good here!\n\n"
fi

sed -i '' '/Add Brew bin in the path/d' ~/.zprofile
sed -i '' '/homebrew/d' ~/.zprofile

printf "Homebrew has gone..\n\n"