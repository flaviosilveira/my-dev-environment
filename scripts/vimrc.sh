#!/bin/bash

# .vimrc file
if [ -e ~/.vimrc -a "$1" != "-f" ]
then
  printf "Oops! You already have a .vimrc file in your home folder!\nUse -f as last parameter to force an update!\n\n" 
else
  printf "Installing VIM configs...\n"
  cp files/vimrc ~/.vimrc
  chmod 644 ~/.vimrc
  printf ".vimrc file Installed! Set permission 644...done!\n\n"
fi

# Install Vundle and Plugins
if [ -d ~/.vim/bundle/Vundle.vim -a "$1" != "-f" ]
then
  printf "Oops! You already have a Vundle Setup started and/or some Plugins!\nUse -f as last parameter to force an update!\n\n" 
else
  rm -rf ~/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  printf "Vundle Installed!\n"

  printf "Running Plugins Installation...\n"
  vim +PluginInstall +qall
  printf "Plugins Installation Complete!\n\n"
fi



