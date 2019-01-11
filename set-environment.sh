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
  
  --brew)
    printf "Installing Homebrew...\n"
  ;;

  *)
    printf "Installing...\n\n"
    ./scripts/vim-config.sh
  ;;

  esac

;;

remove)

  case $2 in
  
  --vim)
    ./scripts/remove-vim-config.sh
  ;;

  *)
    printf "Removing...\n\n"
    ./scripts/remove-vim-config.sh
  ;;

  esac
;;

*) 
  printf "SetEnvironment: $1 is not a SetEnvironment command.\n"
;;

esac
