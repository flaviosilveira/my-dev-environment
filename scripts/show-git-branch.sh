
#!/bin/bash

if [ ! -e ~/.bash_profile ]
then
  printf "Cant find .bash_profile file.. creating one..\n"
  touch ~/.bash_profile
  chmod 644 ~/.bash_profile
  printf ".bash_profile created!\n\n"
fi

if  [[ $(command grep -il "parse_git_branch()" ~/.bash_profile) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Looks like you already have some tricks in your bash profile to show you the git branch..\nUse -f to remove it and re-add them.\n\n"
else

  if [[ $(command grep -il "parse_git_branch()" ~/.bash_profile) != "" ]]
  then
    printf "Removing actual parse git branch..."
    ./scripts/remove-show-git-branch.sh
  fi

  printf "Creating parse git branch...\n"
  echo "" >> ~/.bash_profile
  echo "## Show git branch ###" >> ~/.bash_profile
  echo "parse_git_branch() {" >> ~/.bash_profile
  echo "  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'" >> ~/.bash_profile
  echo "}" >> ~/.bash_profile
  echo "" >> ~/.bash_profile
  echo "export PS1=\"\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ \"" >> ~/.bash_profile
  printf "Parse git branch created!\n\n"

fi
