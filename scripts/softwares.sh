#!/bin/bash

SOURCE_PATH=$(dirname "$0")
source "$SOURCE_PATH/utils.sh"

install_cli_pkg "ripgrep" "ripgrep"
install_cli_pkg "vim" "vim"
install_cli_pkg "mysql-client" "mysql-client"
install_cli_pkg "universal-ctags" "universal-ctags"
install_cli_pkg "go" "golang-go"
install_cli_pkg "tmux" "tmux"
install_cli_pkg "gh" "gh"
install_cli_pkg "libpq" "postgresql-client"

# Image paste in terminal apps (ai-room's console): macOS has it built in
if [[ "$OS_TYPE" == "linux-ubuntu" ]]; then
    install_cli_pkg "" "wl-clipboard"
    install_cli_pkg "" "xclip"
fi

# Yazi file manager
if ! command -v yazi &> /dev/null; then
    if [[ "$OS_TYPE" == "macos" ]]; then
        brew install yazi
    elif [[ "$OS_TYPE" == "linux-ubuntu" ]]; then
        printf "Installing Yazi via snap...\n"
        sudo snap install yazi --classic
    fi
fi

# AWS CLI
if ! command -v aws &> /dev/null; then
    if [[ "$OS_TYPE" == "macos" ]]; then
        brew install awscli
    elif [[ "$OS_TYPE" == "linux-ubuntu" ]]; then
        printf "Installing AWS CLI via snap...\n"
        sudo snap install aws-cli --classic
    fi
fi

# ASDF Installation
if ! command -v asdf &> /dev/null; then
    if [[ "$OS_TYPE" == "macos" ]]; then
        brew install asdf
    elif [[ "$OS_TYPE" == "linux-ubuntu" ]]; then
        printf "Installing ASDF via git...\n"
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
    fi
fi

# ASDF Profile Config
add_to_profile "## ASDF Runtime Manager ###"
if [[ "$OS_TYPE" == "macos" ]]; then
    add_to_profile ". /opt/homebrew/opt/asdf/libexec/asdf.sh"
else
    add_to_profile ". \"\$HOME/.asdf/asdf.sh\""
fi

# Reload ASDF for the current session to use it for plugins
if [[ "$OS_TYPE" == "macos" ]]; then
    . /opt/homebrew/opt/asdf/libexec/asdf.sh 2>/dev/null || true
else
    . "$HOME/.asdf/asdf.sh" 2>/dev/null || true
fi

# asdf 0.16+ replaced `asdf global` with `asdf set -u`; Homebrew ships the new one
asdf_global() {
    asdf set -u "$@" 2>/dev/null || asdf global "$@"
}

# ASDF Plugins for Node, Java and Android
printf "Configuring ASDF plugins...\n"
if command -v asdf &> /dev/null; then
    asdf plugin add nodejs 2>/dev/null || true
    asdf plugin add java 2>/dev/null || true

    # Node via ASDF, with pnpm through corepack
    if ! asdf list nodejs 2>/dev/null | grep -Eq '^[ *]*24\.'; then
        printf "Installing Node 24 via ASDF...\n"
        NODE_VERSION=$(asdf latest nodejs 24)
        asdf install nodejs "$NODE_VERSION"
        asdf_global nodejs "$NODE_VERSION"
        corepack enable pnpm
        asdf reshim nodejs
    fi
    asdf plugin add android-sdk https://github.com/mise-plugins/mise-android-sdk.git 2>/dev/null || true

    # Java via ASDF
    if ! asdf list java &>/dev/null; then
        printf "Installing Java (openjdk-17.0.2) via ASDF...\n"
        asdf install java openjdk-17.0.2
        asdf_global java openjdk-17.0.2
    fi
    
    # Android SDK via ASDF
    if ! asdf list android-sdk &>/dev/null; then
        printf "Installing Android SDK via ASDF...\n"
        asdf install android-sdk 19.0
        asdf_global android-sdk 19.0
    fi
fi

# Android SDK Profile Config
add_to_profile "## Android SDK ###"
add_to_profile "export ANDROID_HOME=\"\$HOME/.asdf/installs/android-sdk/19.0\""
add_to_profile "export PATH=\"\$PATH:\$ANDROID_HOME/emulator\""
add_to_profile "export PATH=\"\$PATH:\$ANDROID_HOME/platform-tools\""
add_to_profile "export PATH=\"\$PATH:\$ANDROID_HOME/cmdline-tools/19.0/bin\""

# Go Profile Config
add_to_profile "## Go Language ###"
if [[ "$OS_TYPE" == "macos" ]]; then
    add_to_profile "export PATH=\"/usr/local/go/bin:\$PATH\""
else
    if [ -d "/usr/local/go/bin" ]; then
        add_to_profile "export PATH=\"/usr/local/go/bin:\$PATH\""
    fi
fi

if [[ "$OS_TYPE" == "macos" ]]; then
    # Homebrew Cask for macOS
    brew install --cask slack dropbox google-chrome font-jetbrains-mono-nerd-font
elif [[ "$OS_TYPE" == "linux-ubuntu" ]]; then
    # Google Chrome for Ubuntu
    if ! command -v google-chrome &> /dev/null; then
        printf "Installing Google Chrome...\n"
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo apt install -y ./google-chrome-stable_current_amd64.deb
        rm google-chrome-stable_current_amd64.deb
    fi

    # Slack for Ubuntu
    if ! command -v slack &> /dev/null; then
        printf "Installing Slack...\n"
        if command -v snap &> /dev/null; then
            sudo snap install slack --classic
        fi
    fi
    
    # Dropbox for Ubuntu
    if ! command -v dropbox &> /dev/null; then
         printf "Installing Dropbox...\n"
         sudo apt install -y nautilus-dropbox
    fi
fi
