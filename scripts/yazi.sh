#!/bin/bash

# ~/.config/yazi/yazi.toml (Yazi itself is installed by softwares.sh)
if [ -e ~/.config/yazi/yazi.toml -a "$1" != "-f" ]
then
  printf "Oops! You already have a yazi.toml!\nUse -f as last parameter to force an update!\n\n"
else
  mkdir -p ~/.config/yazi
  cp files/yazi.toml ~/.config/yazi/yazi.toml
  printf "yazi.toml installed!\n\n"
fi
