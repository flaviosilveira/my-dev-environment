#!/bin/bash

if [[ $(command -v brew) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have Homebrew installed!\nUse -f as last parameter to force an update!\n\n" 
else

  if [[ $(command -v brew) == "" ]]
  then
    printf "Removing old Homebrew install..\n"
    $PWD/scripts/remove-brew.sh
  fi

  printf "Installing Homebrew...\n"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "" >> ~/.zprofile
  echo "## Add Brew bin in the path ###" >> ~/.zprofile
  echo "export PATH='$PATH:/opt/homebrew/bin'" >> ~/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  printf "Homebrew Installed!\n"

fi

