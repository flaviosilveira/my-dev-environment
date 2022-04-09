#!/bin/bash

# Setting script permissin to execute
chmod +x scripts/*.sh

# Check parameters
if [ "$#" -lt 1 -o "$#" -gt 3 ]
then
  $PWD/scripts/usage.sh
  exit
fi

# There are some parameters, so lets check them
case $1 in

install)

  case $2 in

  --vimrc)
    $PWD/scripts/vimrc.sh "${@: -1}"
  ;;

  --brew)
    $PWD/scripts/brew.sh "${@: -1}"
  ;;

  --brewsoftwares)
    $PWD/scripts/brew-softwares.sh "${@: -1}"
  ;;

  --docker)
    $PWD/scripts/docker.sh "${@: -1}"
  ;;

  --gnusoftwares)
    $PWD/scripts/gnu-softwares.sh "${@: -1}"
  ;;

  --gitshortcuts)
    $PWD/scripts/git-shortcuts.sh "${@: -1}"
  ;;

  --showgitbranch)
    $PWD/scripts/show-git-branch.sh "${@: -1}"
  ;;

  --bashshortcuts)
    $PWD/scripts/bash-shortcuts.sh "${@: -1}"
  ;;

  *)
    printf "Installing...\n\n"
    $PWD/scripts/brew-softwares.sh "${@: -1}"
    $PWD/scripts/vimrc.sh "${@: -1}"
    $PWD/scripts/docker.sh "${@: -1}"
    $PWD/scripts/gnu-softwares.sh "${@: -1}"
    $PWD/scripts/git-shortcuts.sh "${@: -1}"
    $PWD/scripts/show-git-branch.sh "${@: -1}"
    $PWD/scripts/bash-shortcuts.sh "${@: -1}"
  ;;

  esac

;;

remove)

  case $2 in
  
  --vimrc)
    $PWD/scripts/remove-vimrc.sh
  ;;

  --docker)
    $PWD/scripts/remove-docker.sh
  ;;

  --gnusoftwares)
    $PWD/scripts/remove-gnu-softwares.sh
  ;;

  --brewsoftwares)
    $PWD/scripts/remove-brew-softwares.sh
  ;;

  --brew)
    $PWD/scripts/remove-brew.sh
  ;;

  --gitshortcuts)
    $PWD/scripts/remove-git-shortcuts.sh
  ;;

  --showgitbranch)
    $PWD/scripts/remove-show-git-branch.sh
  ;;

  --bashshortcuts)
    $PWD/scripts/remove-bash-shortcuts.sh
  ;;

  *)
    printf "Removing...\n\n"
    $PWD/scripts/remove-vimrc.sh
    $PWD/scripts/remove-docker.sh
    $PWD/scripts/remove-gnu-softwares.sh
    $PWD/scripts/remove-brew-softwares.sh
    $PWD/scripts/remove-brew.sh
    $PWD/scripts/remove-git-shortcuts.sh
    $PWD/scripts/remove-show-git-branch.sh
    $PWD/scripts/remove-bash-shortcuts.sh
  ;;

  esac
;;

*) 
  printf "SetEnvironment: $1 is not a SetEnvironment command.\n"
;;

esac
