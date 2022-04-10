#!/bin/bash
source ./src/helper.sh

if command -v zsh &> /dev/null; then
  say_green "zsh is already installed."
  exit 0
else
  say_yellow "Installing zsh"
  brew install zsh
  say_yellow "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [[ $OSTYPE == 'linux-gnu' ]]; then
  say_yellow 'Installing zsh'
  test -d "${HOME}"/.linuxbrew && eval "$("${HOME}"/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  test -r "${HOME}"/.zshrc && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> "${HOME}"/.zshrc
  echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> "${HOME}"/.zshrc
fi

if command -v zsh &> /dev/null; then
  say_green "zsh is now installed."
  exit 0
else
  say_red "zsh is not installed."
  exit 1
fi
