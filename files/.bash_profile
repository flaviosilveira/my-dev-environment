## Git Shortcuts ###
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gc='git commit'

## Show git branch ###
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

## Bash Shortcuts ###
alias ll='ls -l'
alias v='/usr/local/bin/vim'

echo 'export PATH="/usr/local/opt/mysql-client/bin:$PATH"' >> ~/.zprofile

