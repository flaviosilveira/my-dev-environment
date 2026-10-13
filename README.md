# My Dev Environment

Simple script to install, update or remove my development environment.

* Homebrew (macOS) or apt (Ubuntu)
* Softwares
  * Ripgrep
  * Ctags
  * tmux, GitHub CLI (gh), PostgreSQL client, Azure CLI (az)
  * Node 24 and pnpm via asdf (pnpm through corepack); Java 17 and the Android SDK too
  * Clipboard tools for image paste on Ubuntu (wl-clipboard, xclip)
  * AI coding agents: Claude Code and Codex (npm, on asdf's Node) and the Antigravity CLI (agy, its official installer); log in to each once
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

Works on macOS and Ubuntu. On macOS everything comes from Homebrew, which the
install sets up first. Ubuntu has no Homebrew: CLI tools come from apt, Docker
and Chrome from their vendors' apt repositories, Slack, Yazi and the AWS CLI
from snap, the Azure CLI from Microsoft's installer, and Node, Java and the
Android SDK from asdf.

### Before you start

* macOS: update the system and install the Xcode command line tools
  (`xcode-select --install`).
* Ubuntu: `sudo apt update && sudo apt install -y git curl`.

### Install

```bash
git clone https://github.com/flaviosilveira/my-dev-environment.git ~/dev/my-dev-environment
cd ~/dev/my-dev-environment
./set-environment.sh install
```

Follow the output: some steps ask for your password. Then open a new terminal,
or reload your profile (`source ~/.zshrc`, or `source ~/.bashrc` on Ubuntu). On
Ubuntu, log out and back in once so Docker works without `sudo`.

Add `-f` as the last parameter to force a reinstall of what is already there.

### One part only

```bash
./set-environment.sh install --softwares
./set-environment.sh remove --docker
```

Parts: `--base`, `--softwares`, `--vimrc`, `--yazi`, `--docker`,
`--gnusoftwares`, `--gitshortcuts`, `--showgitbranch`, `--bashshortcuts`,
`--devcleanup`.

### Remove

```bash
./set-environment.sh remove
```

The shortcuts go to the profile of your login shell (`$SHELL`), so they show
up in the shell you actually use.

## Contributing

Feel free if you wish to contribute here.
