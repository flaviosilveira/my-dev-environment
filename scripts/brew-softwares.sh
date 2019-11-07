#!/bin/bash

if  [[ $(command brew ls | grep ripgrep) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have Rip Grep installed!\nUse -f as last parameter to force an update!\n\n" 
else
  if [[ $(command brew ls | grep ripgrep) != "" ]]
  then
    printf "Upgrading RipGrep version...\n"
    brew upgrade ripgrep
    printf "RipGrep is up to date!\n"
  else
    printf "Installing RipGrep version...\n"
    brew install ripgrep
    printf "RipGrep installed!\n"
  fi
fi

if  [[ $(command brew ls | grep vim) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have Vim (via homebrew) installed!\nUse -f as last parameter to force an update!\n\n" 
else
  if [[ $(command brew ls | grep vim) != "" ]]
  then
    printf "Upgrading Vim (via homebrew) version...\n"
    brew upgrade vim
    printf "Vim (via homebrew) is up to date!\n"
  else
    printf "Installing Vim (via homebrew) version...\n"
    brew install vim
    printf "Vim (via homebrew) installed!\n"
  fi
fi

if  [[ $(command brew ls | grep mysql-client) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have Mysql-client (via homebrew) installed!\nUse -f as last parameter to force an update!\n\n" 
else
  if [[ $(command brew ls | grep mysql-client) != "" ]]
  then
    printf "Upgrading Mysql-client (via homebrew) version...\n"
    brew upgrade mysql-client
    printf "Mysql-client (via homebrew) is up to date!\n"
  else
    printf "Installing Mysql-client (via homebrew) version...\n"
    brew install mysql-client
    echo 'export PATH="/usr/local/opt/mysql-client/bin:$PATH"' >> ~/.bash_profile
    printf "Mysql-client (via homebrew) installed!\n"
  fi
fi

if  [[ $(command brew ls | grep ctags) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have ctags (via homebrew) installed!\nUse -f as last parameter to force an update!\n\n" 
else
  if [[ $(command brew ls | grep ctags) != "" ]]
  then
    printf "Upgrading ctags (via homebrew) version...\n"
    brew upgrade ctags
    printf "ctags (via homebrew) is up to date!\n"
  else
    printf "Installing ctags (via homebrew) version...\n"
    brew install ctags
    printf "ctags (via homebrew) installed!\n"
  fi
fi

if  [[ $(command brew ls | grep node) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have Node (via homebrew) installed!\nUse -f as last parameter to force an update!\n\n" 
else
  if [[ $(command brew ls | grep node) != "" ]]
  then
    printf "Upgrading node (via homebrew) version...\n"
    brew upgrade node
    printf "node (via homebrew) is up to date!\n"
  else
    printf "Installing node (via homebrew) version...\n"
    brew install node
    printf "node (via homebrew) installed!\n"
  fi
fi
