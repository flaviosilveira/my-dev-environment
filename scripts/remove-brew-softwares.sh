#!/bin/bash

brew --version  > /dev/null 2>&1

if [ $? -eq 0 ]
then
  if  [[ $(command brew ls | grep ripgrep) != "" ]]
  then
    printf "Removing RipGrep..\n"
    brew remove --force ripgrep
    printf "RipGrep was removed!\n\n"
  else
    printf "Looks like ripgrep is not installed.. Everything good here!\n\n"
  fi

  if  [[ $(command brew ls | grep mysql-client) != "" ]]
  then
    printf "Removing RipGrep..\n"
    brew remove --force mysql-client
    printf "mysql-client was removed!\n\n"
  else
    printf "Looks like mysql-client is not installed.. Everything good here!\n\n"
  fi

  if  [[ $(command brew ls | grep vim) != "" ]]
  then
    printf "Removing Vim..\n"
    brew remove --force vim
    printf "Vim was removed!\n\n"
  else
    printf "Looks like Vim is not installed.. Everything good here!\n\n"
  fi

  if  [[ $(command brew ls | grep slack) != "" ]]
  then
    printf "Removing Slack..\n"
    brew remove --cask --force slack
    printf "Slack was removed!\n\n"
  else
    printf "Looks like Slack is not installed.. Everything good here!\n\n"
  fi

  if  [[ $(command brew ls | grep dropbox) != "" ]]
  then
    printf "Removing Dropbox..\n"
    brew remove --cask --force dropbox
    printf "Dropbox was removed!\n\n"
  else
    printf "Looks like Dropbox is not installed.. Everything good here!\n\n"
  fi

  if  [[ $(command brew ls | grep visual-studio-code) != "" ]]
  then
    printf "Removing visual-studio-code..\n"
    brew remove --cask --force visual-studio-code
    printf "visual-studio-code was removed!\n\n"
  else
    printf "Looks like visual-studio-code is not installed.. Everything good here!\n\n"
  fi

  if  [[ $(command brew ls | grep google-chrome) != "" ]]
  then
    printf "Removing google-chrome..\n"
    brew remove --cask --force google-chrome
    printf "google-chrome was removed!\n\n"
  else
    printf "Looks like google-chrome is not installed.. Everything good here!\n\n"
  fi

else
    printf "Brew is necessary here.... skipping...\n\n"
fi

sed -i '' '/Visual/d' ~/.zprofile