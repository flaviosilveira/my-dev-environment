#!/bin/bash

if  [[ $(command brew ls | grep ripgrep) != "" ]]
then
  printf "Removing RipGrep..\n"
  brew remove --force ripgrep
  printf "RipGrep was removed!\n\n"
else
  printf "Looks like ripgrep is not installed.. Everything good here!\n\n"
fi

if  [[ $(command brew ls | grep vim) != "" ]]
then
  printf "Removing Vim..\n"
  brew remove --force vim
  printf "Vim was removed!\n\n"
else
  printf "Looks like Vim is not installed.. Everything good here!\n\n"
fi

