#!/bin/bash

SOURCE_PATH=$(dirname "$0")
source "$SOURCE_PATH/utils.sh"

printf "Removing show git branch from $PROFILE_FILE...\n"

if [ ! -e "$PROFILE_FILE" ]
then
  printf "Profile file not found! All done here!\n\n"
  exit 0
fi

# Clean up the function and prompt configuration surgically
# We remove the block from the header until the closing brace of the function
sed_inplace '/## Show git branch ###/,/^}$/d' "$PROFILE_FILE"
sed_inplace '/setopt PROMPT_SUBST/d' "$PROFILE_FILE"
sed_inplace "/PROMPT='%9c/d" "$PROFILE_FILE"
sed_inplace '/export PS1=.*parse_git_branch/d' "$PROFILE_FILE"

printf "Show git branch configuration is gone\n\n"
