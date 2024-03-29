# My Dev Environment

Simple script to install, update or remove my development environment.

* Homebrew
* Softwares via Homebrew
  * Ripgrep
  * Ctags
  * Vim (With my Vimrc config, Vundle and Plugin [Nerdtree, Airline, Surround, Emmet])
  * Visual Studio Code
  * Dropbox
  * Slack
  * Mysql Cli
  * Docker
* Gnu Softwares
  * Sed (via homebrew)
* Git Shortcuts
  * gs - git status
  * ga - git add
  * gc - git commit
  * gpom - git push origin master

## Getting Started

### Install Brew
./scripts/brew.sh

### Source
source ~/.zprofile

### Install
./set-environment.sh install
**Use -f as last parameter to force re-install**

### Source Again
source ~/.zprofile

### Remove
./set-environment.sh remove

### Just one option
Example: ./set-environment.sh remove --brew

### Prerequisites

Make sure you are able to do a git clone command.
You will also need to be able to execute some basic terminal commands like ls, cp, chmod and so on...

Follow the outputs in the screen! Maybe script requests your password.

Git Shortcuts are based in Bash, using your .bash_profile file.

### Installing

- Git clone
- Execute the set-environment.sh

## Contributing

Feel free if you wish to contribute here.

# Instructions when in a new Mac

* Update SO to the last version possible
* Install XCode cli
* Clone this project
* Run ./set-environment --install
