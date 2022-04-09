#!/bin/bash
source ./src/helper.sh

if command -v go &> /dev/null; then
  say_green "go is already installed."
  exit 0
fi

brew install go

if command -v go &> /dev/null; then
  say_green "go is now installed."
  exit 0
else
  say_red "go is not installed."
  exit 1
fi
