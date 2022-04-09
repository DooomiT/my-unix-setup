#!/bin/bash

RESET="\\033[0m"
RED="\\033[31;1m"
GREEN="\\033[32;1m"
YELLOW="\\033[33;1m"

say_green() {
  [ -z "${SILENT}" ] && printf "%b%s%b\\n" "${GREEN}" "$1" "${RESET}"
  return 0
}

say_red() {
  printf "%b%s%b\\n" "${RED}" "$1" "${RESET}"
}

say_yellow() {
  [ -z "${SILENT}" ] && printf "%b%s%b\\n" "${YELLOW}" "$1" "${RESET}"
  return 0
}

export -f say_green
export -f say_red
export -f say_yellow
