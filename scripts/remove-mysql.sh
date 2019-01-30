#!/bin/bash

if  [[ $(command brew ls | grep mysql) != "" ]]
then
  printf "Removing Mysql (via Homebrew)..\n"
  brew remove --force mysql
  printf "Mysql (via Homebrew) was removed!\n\n"
else
  printf "Looks like Mysql (via Homebrew) is not installed.. Everything good here!\n\n"
fi
