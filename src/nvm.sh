#!/bin/bash
source ./src/helper.sh

if command -v nvm &> /dev/null; then
  say_green "nvm is already installed."
  exit 0
fi

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

if command -v nvm &> /dev/null; then
  say_green "nvm is now installed."
  exit 0
else
  say_red "nvm is not installed."
  exit 1
fi
