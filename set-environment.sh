#!/bin/bash

case $1 in

install) 

if ls ~/.vimrc
then
    printf "You already have a .vimrc file in your home folder!\nConsider use the update command! Use the --vimrc option if you just want to update the vimrc file.\n" 
else
    cp files/vimrc ~/.vimrc
    chmod 644 ~/.vimrc
fi

;;

update) echo "TODO Udate";;

remove) echo "TODO Remove";;

*) 
printf "\nUsage: set-environment.sh COMMAND\n"
printf "Tool for set up Flavio's Dev Environment\n\n\n"

printf "Commands:\n"
printf "install      Very first install, fresh new machine!\n"
printf "update       Update versions and overwrite files\n"
printf "remove       Everything is going to be destroyed in 3, 2, 1...\n"

printf "\n\n"
;;
esac
