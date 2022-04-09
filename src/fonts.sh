#!/bin/bash

source ./src/helper.sh

say_red "font.sh is ready yet"
exit 0

if [[ $(fc-list | grep -q 'Caskaydia Cove Nerd Font Complete Mono') ]]; then
    say_green "Caskaydia Cove Nerd Font is already installed."
    exit 0
    # if extended with other fonts use variables to check if font is installed
fi

say_yellow "Installing Caskaydia Cove Nerd Font Complete Mono"

curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip --output CascadiaCode.zip
unzip CascadiaCode.zip
 ~/.fonts

if [[ $OSTYPE == 'darwin'* ]]; then
    mv -v CascadiaCode/* ~/Library/Fonts
fi

if [[ $OSTYPE == 'linux-gnu' ]]; then
    mv -v CascadiaCode/* ~/.fonts
fi
rm -rf CascadiaCode
#rm -rf CascadiaCode.zip

if [[ $(fc-list | grep -q 'Caskaydia Cove Nerd Font Complete Mono') ]]; then
    say_green "Caskaydia Cove Nerd Font is now installed."
    exit 0
else 
    say_red "Caskaydia Cove Nerd Font is not installed."
    exit 1
fi
