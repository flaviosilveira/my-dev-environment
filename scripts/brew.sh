#!/bin/bash

if [[ $(command -v brew) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have Homebrew installed!\nUse -f as last parameter to force an update!\n\n" 
else

  if [[ $(command -v brew) == "" ]]
  then
    printf "Removing old Homebrew install..\n"
    ./remove-brew.sh
  fi

  printf "Installing Homebrew...\n"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "" >> ~/.zprofile
  echo "## Add Brew bin in the path ###" >> ~/.zprofile
  echo "export PATH='\$PATH:/opt/homebrew/bin'" >> ~/.zprofile
  export PATH='\$PATH:/opt/homebrew/bin
  printf "Homebrew Installed!\n"

fi

