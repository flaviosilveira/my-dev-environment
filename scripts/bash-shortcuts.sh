#!/bin/bash

if [ ! -e ~/.bash_profile ]
then
  printf "Cant find .bash_profile file.. creating one..\n"
  touch ~/.bash_profile
  chmod 644 ~/.bash_profile
  printf ".bash_profile created!\n\n"
fi

if  [[ $(command grep -il "ls -l" ~/.bash_profile) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Looks like you already have some bash shortcuts in your bash profile..\nUse -f to remove them and re-add them.\n\n"
else

  if [[ $(command grep -il "ls -l" ~/.bash_profile) != "" ]]
  then
    printf "Removing actual bash shortcuts..."
    ./scripts/remove-bash-shortcuts.sh
  fi

  printf "Creating shortcuts...\n"
  echo "" >> ~/.bash_profile
  echo "## Bash Shortcuts ###" >> ~/.bash_profile
  echo "alias ll='ls -l'" >> ~/.bash_profile
  echo "alias v='/usr/local/bin/vim'" >> ~/.bash_profile
  echo "alias composer='docker run --rm --interactive --tty --volume $PWD:/app composer'"
  echo "alias hugo-server='docker run --rm --name "hugo1" -p 1313:1313 -v $(pwd)/src:/src -v $(pwd)/public:/output -e HUGO_THEME="ananke" -e HUGO_WATCH="true" jojomi/hugo'"
  echo "alias hugo-kill='docker stop hugo1'"
  echo "alias hugo-build='docker run --rm --name "hugo2" -v $(pwd)/src:/src -v $(pwd)/public:/output -e HUGO_THEME="ananke" jojomi/hugo'"
  echo "alias hugo-pre-deploy='docker run --rm --name "hugo2" -v $(pwd)/src:/src -v $(pwd)/public:/output -e HUGO_THEME="ananke" -e HUGO_BASEURL="http://flaviosilveira.com" -e HUGO_ENVIRONMENT="production" jojomi/hugo'"
  echo "LC_ALL=en_US.UTF-8" >> ~/.bash_profile
  printf "Shortcuts created!\n\n"

fi
