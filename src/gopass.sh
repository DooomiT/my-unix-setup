#!/bin/bash
source ./src/helper.sh

if command -v gopass &> /dev/null; then
  say_green "gopass is already installed."
  exit 0
fi

go install github.com/gopasspw/gopass@latest

if command -v gopass &> /dev/null; then
  say_green "gopass is now installed."
  exit 0
else
  say_red "gopass is not installed."
  exit 1
fi
