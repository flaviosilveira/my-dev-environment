
#!/bin/bash

brew --version

if [ $? -eq 0 ]
then
  printf "Removing Homebrew.. Will Require Password..\n"
  curl -O https://raw.githubusercontent.com/Homebrew/install/master/uninstall
  chmod +x uninstall
  ./uninstall -f -q
  rm -rf ./uninstall
  printf "Homebrew has gone..\n\n"
else
  printf "Looks like Homebrew is not installed.. Everything good here!\n\n"
fi
