#!/bin/bash

if  [[ $(command -v docker) != "" ]]
then
  printf "Removing Docker..\n"
  if [ ! -e /Applications/Docker.app/Contents/MacOS/Docker ]
  then
    printf "Cant remove Docker... Looks like it is not installed in the default directory.. Use GUI!"
  else
    /Applications/Docker.app/Contents/MacOS/Docker --uninstall
    rm -rf /Applications/Docker.app
    printf "Docker was removed!\n\n"
  fi
else
  printf "Looks like Docker is not installed.. Everything good here!\n\n"
fi
