#!/bin/sh

set START_DIR $(pwd)
cd /home/kuper/.dotfiles/KuperOS || exit 1
sudo nixos-rebuild switch --flake .#nixos
cd $START_DIR || exit 1
