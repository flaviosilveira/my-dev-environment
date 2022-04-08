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

if  [[ $(command brew ls | grep visual-studio-code) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have visual-studio-code (via homebrew) installed!\nUse -f as last parameter to force an update!\n\n" 
else
  if [[ $(command brew ls | grep visual-studio-code) != "" ]]
  then
    printf "Upgrading visual-studio-code (via homebrew) version...\n"
    brew upgrade visual-studio-code
    printf "visual-studio-code (via homebrew) is up to date!\n"
  else
    printf "Installing visual-studio-code (via homebrew) version...\n"
    brew install --cask visual-studio-code
    echo "" >> ~/.zprofile
    echo "## Add Visual Studio Code (code) ###" >> ~/.zprofile
    echo "export PATH='\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin'" >> ~/.zprofile
    export PATH='\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin'
    printf "visual-studio-code (via homebrew) installed!\n"
  fi
fi

if  [[ $(command brew ls | grep postman) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have postman (via homebrew) installed!\nUse -f as last parameter to force an update!\n\n" 
else
  if [[ $(command brew ls | grep postman) != "" ]]
  then
    printf "Upgrading postman (via homebrew) version...\n"
    brew upgrade postman
    printf "postman (via homebrew) is up to date!\n"
  else
    printf "Installing postman (via homebrew) version...\n"
    brew install --cask postman
    printf "postman (via homebrew) installed!\n"
  fi
fi

if  [[ $(command brew ls | grep slack) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have slack (via homebrew) installed!\nUse -f as last parameter to force an update!\n\n" 
else
  if [[ $(command brew ls | grep slack) != "" ]]
  then
    printf "Upgrading slack (via homebrew) version...\n"
    brew upgrade slack
    printf "slack (via homebrew) is up to date!\n"
  else
    printf "Installing slack (via homebrew) version...\n"
    brew install --cask slack
    printf "slack (via homebrew) installed!\n"
  fi
fi

if  [[ $(command brew ls | grep dropbox) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Oops! You already have dropbox (via homebrew) installed!\nUse -f as last parameter to force an update!\n\n" 
else
  if [[ $(command brew ls | grep dropbox) != "" ]]
  then
    printf "Upgrading dropbox (via homebrew) version...\n"
    brew upgrade slack
    printf "dropbox (via homebrew) is up to date!\n"
  else
    printf "Installing dropbox (via homebrew) version...\n"
    brew install --cask dropbox
    printf "dropbox (via homebrew) installed!\n"
  fi
fi
