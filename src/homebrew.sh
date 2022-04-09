#!/bin/bash
source ./src/helper.sh

if command -v brew &> /dev/null; then
  say_green "Homebrew is already installed."
  exit 0
fi

if [[ $OSTYPE == 'darwin'* ]]; then
  say_yellow 'Install Homebrew macOS'
fi

if [[ $OSTYPE == 'linux-gnu' ]]; then
  say_yellow 'Pre install Homebrew Ubuntu'
  sudo apt-get install build-essential procps curl file git
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ $OSTYPE == 'darwin'* ]]; then
  say_yellow 'Post install Homebrew macOS'
  echo "PATH='/usr/local/bin:$PATH'" >> "${HOME}"/.bashrc
fi

if [[ $OSTYPE == 'linux-gnu' ]]; then
  say_yellow 'Post install Homebrew Ubuntu'
  test -d "${HOME}"/.linuxbrew && eval "$("${HOME}"/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  test -r "${HOME}"/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> "${HOME}"/.bashrc
  echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> "${HOME}"/.bashrc
fi

source "${HOME}"/.bashrc
if command -v brew &> /dev/null; then
  say_green "Homebrew is now installed."
  exit 0
else
  say_red "Homebrew is not installed."
  exit 1
fi
