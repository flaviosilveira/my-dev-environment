#!/bin/bash

printf "Removing VIM config...\n"
rm -rf ~/.vimrc
printf ".vimrc file removed!\n\n"

printf "Removing Vundle and Plugins...\n"
rm -rf ~/.vim/bundle
printf "Vundle and Plugins removed!\n\n"
