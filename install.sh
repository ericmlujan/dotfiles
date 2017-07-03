#!/bin/bash

# An humble installer script for lujan's dotfiles

set -euf -o pipefail

# Global options
HOMEDIR=$HOME
CURRENTDIR="$(pwd)"

# Update git submodules
echo "UPDATE git submodules"
git submodule update --recursive

# Emacs / Spacemacs install
if [[ ! -d "$HOMEDIR/.emacs.d" ]] && [[ ! -L "$HOMEDIR/.emacs.d" ]]; then 
    echo "INSTALL spacemacs distribution"
    ln -s $CURRENTDIR/spacemacs $HOMEDIR/.emacs.d
else
    echo "SKIP spacemacs distribution ($HOMEDIR/.emacs.d already exists)"
fi

if [[ ! -e "$HOMEDIR/.spacemacs" ]] && [[ ! -L "$HOMEDIR/.spacemacs" ]]; then
    echo "INSTALL spacemacs customizations"
    ln -s $CURRENTDIR/emacs/dotspacemacs $HOMEDIR/.spacemacs
else
    echo "SKIP spacemacs customizations ($HOMEDIR/.spacemacs already exists)"
fi

# i3 configuration install
if [[ ! -d "$HOMEDIR/.i3" ]] && [[ ! -L "$HOMEDIR/.i3" ]]; then
    if [[ ! -e "$HOMEDIR/.i3/config" ]] && [[ ! -L "$HOMEDIR/.i3/config" ]]; then
        echo "INSTALL i3 configuration"
        mkdir "$HOMEDIR/.i3"
        ln -s "$CURRENTDIR/linux/i3/config" "$HOMEDIR/.i3/config"
    else
        echo "SKIP install i3 configuration ($HOMEDIR/.i3/config already exists)"
    fi
else
    echo "SKIP install i3 configuration ($HOMEDIR/.i3 directory already present)"
fi

# Done!
echo "Installation complete!"

