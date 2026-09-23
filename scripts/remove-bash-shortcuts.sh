#!/bin/bash

SOURCE_PATH=$(dirname "$0")
source "$SOURCE_PATH/utils.sh"

printf "Removing Shell shortcuts from $PROFILE_FILE...\n"

if [ ! -e "$PROFILE_FILE" ]
then
  printf "Profile file not found! All done here!\n\n"
  exit 0
fi

sed_inplace '/## Shell Shortcuts ###/d' "$PROFILE_FILE"
sed_inplace "/alias ll='ls -l'/d" "$PROFILE_FILE"
sed_inplace "/alias v=/d" "$PROFILE_FILE"
sed_inplace "/function v {/d" "$PROFILE_FILE"
sed_inplace "/export LC_ALL=en_US.UTF-8/d" "$PROFILE_FILE"

sed_inplace '/## Docker shortcuts ###/d' "$PROFILE_FILE"
sed_inplace "/alias dps='docker ps'/d" "$PROFILE_FILE"
sed_inplace "/alias dcu='docker compose up'/d" "$PROFILE_FILE"
sed_inplace "/alias dcd='docker compose down'/d" "$PROFILE_FILE"

printf "Shell Shortcuts are gone\n\n"
