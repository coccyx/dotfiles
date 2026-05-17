#!/bin/bash

set -e

BREW=/opt/homebrew/bin/brew
CHEZMOI=/opt/homebrew/bin/chezmoi

if [ ! -f $BREW ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$($BREW shellenv)"

if [ ! -f "$HOME/Brewfile" ]; then
    curl -fsSLo $HOME/Brewfile https://raw.githubusercontent.com/coccyx/dotfiles/main/Brewfile
fi

if [ ! -f "$HOME/.brewskip" ]; then
    $BREW bundle --file=$HOME/Brewfile
    touch $HOME/.brewskip
fi

mkdir -p $HOME/local/src

if [ ! -f "$HOME/.config/chezmoi/chezmoi.toml" ]; then
    $CHEZMOI init --apply --verbose coccyx
fi
