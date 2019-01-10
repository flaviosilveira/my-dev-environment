#!/bin/bash

args="$@"
last=${args##* }
echo $last
exit

if [ -e ~/.vimrc -a "$last" != "-f" ]
then
  printf "Oops! You already have a .vimrc file in your home folder!\nUse -f as last parameter to force an update! Use the --vimrc option if you just want to update the vimrc file.\n\n" 
else
  printf "Installing VIM configs...\n"
  cp files/vimrc ~/.vimrc
  chmod 644 ~/.vimrc
  printf ".vimrc file installed! Set permission 644...done!\n"

  # Install Vundle
  # Install Plugins
fi
