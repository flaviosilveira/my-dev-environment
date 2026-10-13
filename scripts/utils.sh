#!/bin/bash

# OS Detection
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [ -f /etc/lsb-release ] || [ -f /etc/debian_version ]; then
            echo "linux-ubuntu"
        else
            echo "linux-generic"
        fi
    else
        echo "unknown"
    fi
}

OS_TYPE=$(detect_os)

# Profile Selection: the user's login shell decides, not the OS. macOS
# terminals start login shells, so bash there reads ~/.bash_profile.
get_profile_file() {
    case "$(basename "${SHELL:-}")" in
        zsh) echo "$HOME/.zshrc" ;;
        bash) if [[ "$OS_TYPE" == "macos" ]]; then echo "$HOME/.bash_profile"; else echo "$HOME/.bashrc"; fi ;;
        *) if [[ "$OS_TYPE" == "macos" ]]; then echo "$HOME/.zshrc"; else echo "$HOME/.bashrc"; fi ;;
    esac
}

PROFILE_FILE=$(get_profile_file)

# Package Management Abstraction
install_cli_pkg() {
    local brew_name=$1
    local apt_name=$2

    if [[ "$OS_TYPE" == "macos" ]]; then
        if ! brew list "$brew_name" &>/dev/null; then
            echo "Installing $brew_name via Homebrew..."
            brew install "$brew_name"
        else
            echo "$brew_name is already installed."
        fi
    elif [[ "$OS_TYPE" == "linux-ubuntu" ]]; then
        if ! dpkg -s "$apt_name" &>/dev/null; then
            echo "Installing $apt_name via apt..."
            sudo apt-get install -y "$apt_name"
        else
            echo "$apt_name is already installed."
        fi
    fi
}

# Helper to add lines to profile safely
add_to_profile() {
    local line=$1
    if [ ! -f "$PROFILE_FILE" ]; then
        touch "$PROFILE_FILE"
    fi
    if ! grep -Fxq "$line" "$PROFILE_FILE"; then
        echo "$line" >> "$PROFILE_FILE"
        echo "Added to $PROFILE_FILE: $line"
    fi
}

# OS-agnostic sed in-place helper
sed_inplace() {
    local pattern=$1
    local file=$2
    if [[ "$OS_TYPE" == "macos" ]]; then
        sed -i '' "$pattern" "$file"
    else
        sed -i "$pattern" "$file"
    fi
}
