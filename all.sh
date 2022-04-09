#!/bin/bash
source ./src/helper.sh

if [[ $OSTYPE == 'darwin'* ]]; then
  if ! command -v xcode-select &> /dev/null; then
    say_yellow 'Install xcode-select'
    xcode-select --install
  fi
fi
if [[ $OSTYPE == 'linux-gnu' ]]; then
  say_yellow 'Update ubuntu'
  sudo apt-get update
fi

./src/homebrew.sh
./src/zsh.sh
./src/fonts.sh 
  


