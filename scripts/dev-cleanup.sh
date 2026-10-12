#!/bin/bash

SOURCE_PATH=$(dirname "$0")
source "$SOURCE_PATH/utils.sh"

LABEL="com.$(whoami).dev-cleanup"
PLIST="$HOME/Library/LaunchAgents/$LABEL.plist"

if [[ "$OS_TYPE" != "macos" ]]; then
  printf "dev-cleanup runs on launchd, macOS only. Skipping.\n\n"
  exit 0
fi

if [ -e "$PLIST" -a "$1" != "-f" ]
then
  printf "Oops! You already have dev-cleanup scheduled!\nUse -f as last parameter to force an update!\n\n"
else
  mkdir -p "$HOME/.local/bin" "$HOME/Library/LaunchAgents" "$HOME/Library/Logs"
  cp files/dev-cleanup "$HOME/.local/bin/dev-cleanup"
  chmod +x "$HOME/.local/bin/dev-cleanup"

  sed -e "s|__LABEL__|$LABEL|g" -e "s|__HOME__|$HOME|g" files/dev-cleanup.plist > "$PLIST"
  launchctl bootout "gui/$(id -u)/$LABEL" 2>/dev/null
  launchctl bootstrap "gui/$(id -u)" "$PLIST"

  add_to_profile "## Nx cache cap per worktree (dev-cleanup) ##"
  add_to_profile "export NX_MAX_CACHE_SIZE=2GB"

  printf "dev-cleanup installed! Runs Sundays 03:00. Preview with: DRY_RUN=1 dev-cleanup\n\n"
fi
