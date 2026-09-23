#!/bin/bash

SOURCE_PATH=$(dirname "$0")
source "$SOURCE_PATH/utils.sh"

if [[ $(grep -l "alias ll=" "$PROFILE_FILE" 2>/dev/null) != "" ]] && [[ "$1" != "-f" ]]; then
  printf "Looks like you already have some bash shortcuts in your profile..\nUse -f to remove them and re-add them.\n\n"
else
  if [[ $(grep -l "alias ll=" "$PROFILE_FILE" 2>/dev/null) != "" ]]; then
    printf "Removing actual bash shortcuts...\n"
    "$SOURCE_PATH/remove-bash-shortcuts.sh"
  fi

  printf "Creating shortcuts in $PROFILE_FILE...\n"
  
  VIM_PATH=$(which vim)
  
  add_to_profile "## Shell Shortcuts ###"
  add_to_profile "alias ll='ls -l'"
  if [ -n "$VIM_PATH" ]; then
    # v browses files in Yazi; v <file> edits it in Vim
    add_to_profile "unalias v 2>/dev/null; function v { if [ \$# -eq 0 ] && command -v yazi >/dev/null; then yazi; else $VIM_PATH \"\$@\"; fi; }"
  fi
  add_to_profile "export LC_ALL=en_US.UTF-8"
  
  add_to_profile "## Docker shortcuts ###"
  add_to_profile "alias dps='docker ps'"
  add_to_profile "alias dcu='docker compose up'"
  add_to_profile "alias dcd='docker compose down'"
  
  printf "Shortcuts created!\n\n"
fi
