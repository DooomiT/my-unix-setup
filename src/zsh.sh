#!/bin/bash
source ./src/helper.sh

if command -v zsh &> /dev/null
then
  say_green "zsh is already installed."
  exit 0
else
  say_yellow "~/.zshrc does not exist."
  say_yellow "Installing zsh"
  brew install zsh
  say_yellow "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if command -v zsh &> /dev/null
then
  say_green "zsh is now installed."
  exit 0
else 
  say_red "zsh is not installed."
  exit 1
fi