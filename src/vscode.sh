#!/bin/bash
source ./src/helper.sh

# if code or code-insiders is installed, skip
if command -v code &> /dev/null || command -v code-insiders &> /dev/null; then
  say_green "code or code-insiders is already installed."
  exit 0
fi

brew install --cask visual-studio-code

if command -v code &> /dev/null; then
  say_green "Visual Studio Code is now installed."
  exit 0
else
  say_red "Visual Studio Code is not installed."
  exit 1
fi
