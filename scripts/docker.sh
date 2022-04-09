#!/bin/bash

if [[ $(command -v docker) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have Docker installed!\nUse -f as last parameter to force an update!\n\n"
else

  if [[ $(command -v docker != "") ]]
  then
    printf "Removing docker that is installed...\n\n"
    ./remove-docker.sh
  fi

  printf "Installing Docker App...\n"
  brew install --cask docker
  printf "Docker installed!\n\n"

  printf "Opening Docker App...\n"
  printf "You will be requested by some pop ups by Docker...\n"
  printf "Also asked to enter your password...\n"
  open /Applications/Docker.app
  printf "Docker will be running in a few moments.."
fi
