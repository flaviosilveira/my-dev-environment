#!/bin/bash

SOURCE_PATH=$(dirname "$0")
source "$SOURCE_PATH/utils.sh"

install_cli_pkg "ripgrep" "ripgrep"
install_cli_pkg "vim" "vim"
install_cli_pkg "mysql-client" "mysql-client"
install_cli_pkg "universal-ctags" "universal-ctags"
install_cli_pkg "go" "golang-go"

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

# ASDF Plugins for Java and Android
printf "Configuring ASDF plugins...\n"
if command -v asdf &> /dev/null; then
    asdf plugin add java 2>/dev/null || true
    asdf plugin add android-sdk https://github.com/mise-plugins/mise-android-sdk.git 2>/dev/null || true

    # Java via ASDF
    if ! asdf list java &>/dev/null; then
        printf "Installing Java (openjdk-17.0.2) via ASDF...\n"
        asdf install java openjdk-17.0.2
        asdf global java openjdk-17.0.2
    fi
    
    # Android SDK via ASDF
    if ! asdf list android-sdk &>/dev/null; then
        printf "Installing Android SDK via ASDF...\n"
        asdf install android-sdk latest
        asdf global android-sdk latest
    fi
fi

# Android SDK Profile Config
add_to_profile "## Android SDK ###"
add_to_profile "export ANDROID_HOME=\"\$HOME/.asdf/installs/android-sdk/latest\""
add_to_profile "export PATH=\"\$PATH:\$ANDROID_HOME/emulator\""
add_to_profile "export PATH=\"\$PATH:\$ANDROID_HOME/platform-tools\""
add_to_profile "export PATH=\"\$PATH:\$ANDROID_HOME/cmdline-tools/latest/bin\""

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
    brew install --cask visual-studio-code postman slack dropbox google-chrome
    add_to_profile "## Add Visual Studio Code (code) ###"
    add_to_profile "export PATH='\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin'"
elif [[ "$OS_TYPE" == "linux-ubuntu" ]]; then
    # VS Code for Ubuntu
    if ! command -v code &> /dev/null; then
        printf "Installing VS Code...\n"
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
        sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
        rm -f packages.microsoft.gpg
        sudo apt install -y apt-transport-https
        sudo apt update
        sudo apt install -y code
    fi

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
    
    # Postman for Ubuntu
    if ! command -v postman &> /dev/null; then
        printf "Installing Postman...\n"
        if command -v snap &> /dev/null; then
            sudo snap install postman
        fi
    fi

    # Dropbox for Ubuntu
    if ! command -v dropbox &> /dev/null; then
         printf "Installing Dropbox...\n"
         sudo apt install -y nautilus-dropbox
    fi
fi
