#!/bin/bash

SOURCE_PATH=$(dirname "$0")
source "$SOURCE_PATH/utils.sh"

if [[ $(grep -l "parse_git_branch()" "$PROFILE_FILE" 2>/dev/null) != "" ]] && [[ "$1" != "-f" ]]; then
  printf "Looks like you already have some tricks in your profile to show you the git branch..\nUse -f to remove it and re-add them.\n\n"
else
  if [[ $(grep -l "parse_git_branch()" "$PROFILE_FILE" 2>/dev/null) != "" ]]; then
    printf "Removing actual parse git branch...\n"
    "$SOURCE_PATH/remove-show-git-branch.sh"
  fi

  printf "Creating parse git branch in $PROFILE_FILE...\n"
  
  add_to_profile "## Show git branch ###"
  add_to_profile "parse_git_branch() {"
  add_to_profile "  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'"
  add_to_profile "}"
  
  if [[ "$PROFILE_FILE" == *.zshrc ]]; then
    add_to_profile "setopt PROMPT_SUBST"
    add_to_profile "PROMPT='%9c%{%F{green}%}\$(parse_git_branch)%{%F{none}%} $ '"
  else
    add_to_profile "export PS1='\[\033[01;32m\]\w\[\033[00m\]\[\033[01;33m\]\$(parse_git_branch)\[\033[00m\] $ '"
  fi
  
  printf "Parse git branch created!\n\n"
fi
