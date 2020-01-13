## Git Shortcuts ###
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gc='git commit'

## Show git branch ###
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

## Bash Shortcuts ###
alias ll='ls -l'
alias v='/usr/local/bin/vim'

export LC_ALL=en_US.UTF-8
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
