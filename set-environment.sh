#!/bin/bash

# Setting script permissin to execute
chmod +x scripts/*.sh

# Check parameters
if [ "$#" -lt 1 -o "$#" -gt 3 ]
then
  ./scripts/usage.sh
  exit
fi

# There are some parameters, so lets check them
case $1 in

install)

  case $2 in

  --vim)
    ./scripts/vim-config.sh "${@: -1}"
  ;;

  --docker)
    ./scripts/docker.sh "${@: -1}"
  ;;

  --brew)
    ./scripts/brew.sh "${@: -1}"
  ;;

  --mysql)
    ./scripts/mysql.sh "${@: -1}"
  ;;

  --gitshortcuts)
    ./scripts/git-shortcuts.sh "${@: -1}"
  ;;

  *)
    printf "Installing...\n\n"
    ./scripts/vim-config.sh "${@: -1}"
    ./scripts/docker.sh "${@: -1}"
    ./scripts/brew.sh "${@: -1}"
    ./scripts/mysql.sh "${@: -1}"
    ./scripts/git-shortcuts.sh "${@: -1}"
  ;;

  esac

;;

remove)

  case $2 in
  
  --vim)
    ./scripts/remove-vim-config.sh
  ;;

  --docker)
    ./scripts/remove-docker.sh
  ;;

  --brew)
    ./scripts/remove-brew.sh
  ;;

  --mysql)
    ./scripts/remove-mysql.sh
  ;;

  --gitshortcuts)
    ./scripts/remove-git-shortcuts.sh
  ;;

  *)
    printf "Removing...\n\n"
    ./scripts/remove-vim-config.sh
    ./scripts/remove-docker.sh
    ./scripts/remove-brew.sh
    ./scripts/remove-mysql.sh
    ./scripts/remove-git-shortcuts.sh
  ;;

  esac
;;

*) 
  printf "SetEnvironment: $1 is not a SetEnvironment command.\n"
;;

esac
