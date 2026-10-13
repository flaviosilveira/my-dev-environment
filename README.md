# My Dev Environment

Simple script to install, update or remove my development environment.

* Homebrew (macOS) or apt (Ubuntu)
* Softwares
  * Ripgrep
  * Ctags
  * tmux, GitHub CLI (gh), PostgreSQL client
  * Node 24 and pnpm via asdf (pnpm through corepack); Java 17 and the Android SDK too
  * Clipboard tools for image paste on Ubuntu (wl-clipboard, xclip)
  * Vim (With my Vimrc config, Vundle and Plugin [Airline, Surround, Emmet, CtrlP])
    * `v` browses files in Yazi (Enter opens Vim, `:q` goes back), `v file` edits the file
* Yazi file manager, with `~/.config/yazi/yazi.toml` (wider preview, opens files in Vim)
  * Icons need a Nerd Font: installs JetBrainsMono Nerd Font (macOS); set it as the Terminal profile font
  * Dropbox
  * Slack
  * Mysql Cli
  * Docker
* Gnu Softwares
  * Sed (via homebrew)
* Dev Cleanup (macOS)
  * `~/.local/bin/dev-cleanup`, run weekly by launchd (Sundays 03:00)
  * Removes only regenerable dev leftovers: stale agent temp dirs, Chrome code-sign clone, old Xcode DerivedData, dangling Docker images/build cache, brew/pnpm caches, idle Nx caches
  * Never touches Docker volumes or worktrees; lists stale worktrees as `REVIEW` in `~/Library/Logs/dev-cleanup.log`
  * `DRY_RUN=1 dev-cleanup` previews; also sets `NX_MAX_CACHE_SIZE=2GB`
* Shortcuts, in your shell's profile (`~/.zshrc` for zsh; `~/.bashrc` for bash on Linux, `~/.bash_profile` on macOS)
  * Git: `gs` status, `ga` add, `gd` diff, `gc` commit, `gp` pull, `gch` checkout
  * Shell: `ll` (ls -l), `v` (Yazi with no arguments, Vim with a file)
  * Docker: `dps` (docker ps), `dcu` (compose up), `dcd` (compose down)
  * The git branch in the prompt, in zsh or bash syntax to match
  * `LC_ALL=en_US.UTF-8`; on Ubuntu the locale is generated first when missing

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

The shortcuts go to the profile of your login shell (`$SHELL`), so they show
up in the shell you actually use.

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
