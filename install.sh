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

# Done!
echo "Installation complete!"

