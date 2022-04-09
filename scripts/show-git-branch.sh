
#!/bin/bash

if [ ! -e ~/.zprofile ]
then
  printf "Cant find .zprofile file.. creating one..\n"
  touch ~/.zprofile
  chmod 644 ~/.zprofile
  printf ".zprofile created!\n\n"
fi

if  [[ $(command grep -il "parse_git_branch()" ~/.zprofile) != "" ]] && [[ "$1" != "-f" ]]
then
  printf "Looks like you already have some tricks in your Z profile to show you the git branch..\nUse -f to remove it and re-add them.\n\n"
else

  if [[ $(command grep -il "parse_git_branch()" ~/.zprofile) != "" ]]
  then
    printf "Removing actual parse git branch..."
    $PWD/scripts/remove-show-git-branch.sh
  fi

  printf "Creating parse git branch...\n"
  echo "" >> ~/.zprofile
  echo "## Show git branch ###" >> ~/.zprofile
  echo "parse_git_branch() {" >> ~/.zprofile
  echo "  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'" >> ~/.zprofile
  echo "}" >> ~/.zprofile
  echo "setopt PROMPT_SUBST" >> ~/.zprofile
  echo "PROMPT='%9c%{%F{green}%}$(parse_git_branch)%{%F{none}%} $ '" >> ~/.zprofile
  
  printf "Parse git branch created!\n\n"

fi
