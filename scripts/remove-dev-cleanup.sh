#!/bin/bash

SOURCE_PATH=$(dirname "$0")
source "$SOURCE_PATH/utils.sh"

LABEL="com.$(whoami).dev-cleanup"

printf "Removing dev-cleanup...\n"
if [[ "$OS_TYPE" == "macos" ]]; then
  launchctl bootout "gui/$(id -u)/$LABEL" 2>/dev/null
  rm -f "$HOME/Library/LaunchAgents/$LABEL.plist"
fi
rm -f "$HOME/.local/bin/dev-cleanup"
if [ -f "$PROFILE_FILE" ]; then
  sed_inplace '/^## Nx cache cap per worktree (dev-cleanup) ##$/d' "$PROFILE_FILE"
  sed_inplace '/^export NX_MAX_CACHE_SIZE=/d' "$PROFILE_FILE"
fi
printf "dev-cleanup removed!\n\n"
