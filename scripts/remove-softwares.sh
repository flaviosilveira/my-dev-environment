#!/bin/bash

SOURCE_PATH=$(dirname "$0")
source "$SOURCE_PATH/utils.sh"

remove_cli_pkg() {
    local brew_name=$1
    local apt_name=$2

    if [[ "$OS_TYPE" == "macos" ]]; then
        if brew list "$brew_name" &>/dev/null; then
            printf "Removing $brew_name via Homebrew...\n"
            brew remove --force "$brew_name"
        fi
    elif [[ "$OS_TYPE" == "linux-ubuntu" ]]; then
        if dpkg -s "$apt_name" &>/dev/null; then
            printf "Removing $apt_name via apt...\n"
            sudo apt-get remove -y "$apt_name"
        fi
    fi
}

remove_gui_app() {
    local name=$1
    if [[ "$OS_TYPE" == "macos" ]]; then
        if brew list --cask "$name" &>/dev/null; then
            printf "Removing $name via Homebrew Cask...\n"
            brew remove --cask --force "$name"
        fi
    elif [[ "$OS_TYPE" == "linux-ubuntu" ]]; then
        if command -v snap &>/dev/null; then
            if snap list "$name" &>/dev/null; then
                printf "Removing $name via snap...\n"
                sudo snap remove "$name"
            fi
        fi
        # Also check for apt-installed apps
        if dpkg -s "$name" &>/dev/null; then
             printf "Removing $name via apt...\n"
             sudo apt-get remove -y "$name"
        fi
    fi
}

remove_cli_pkg "ripgrep" "ripgrep"
remove_cli_pkg "vim" "vim"
remove_cli_pkg "mysql-client" "mysql-client"
remove_cli_pkg "universal-ctags" "universal-ctags"
remove_cli_pkg "yazi" "yazi"
remove_gui_app "yazi" # snap on linux

remove_gui_app "visual-studio-code"
remove_gui_app "code" # for linux
remove_gui_app "postman"
remove_gui_app "slack"
remove_gui_app "dropbox"
remove_gui_app "google-chrome"

sed_inplace '/## Add Visual Studio Code (code) ###/d' "$PROFILE_FILE"
sed_inplace '/Visual Studio Code.app/d' "$PROFILE_FILE"

printf "Softwares removal process completed!\n\n"
