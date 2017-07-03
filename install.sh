#!/bin/bash

# An humble installer script for lujan's dotfiles

set -euf -o pipefail

# Global options
HOMEDIR=$HOME
CURRENTDIR="$(pwd)"

# Emacs / Spacemacs install
if [[ ! -d "$HOMEDIR/.emacs.d" ]] && [[ ! -L "$HOMEDIR/.emacs.d" ]]; then 
    echo "INSTALL spacemacs"
    ln -s $CURRENTDIR/spacemacs $HOMEDIR/.emacs.d
else
    echo "SKIP spacemacs ($HOMEDIR/.emacs.d already exists)"
fi

# Done!
echo "Installation complete!"

