#!/bin/sh

set START_DIR $(pwd)
cd /home/kuper/.dotfiles/KuperOS || exit 1
sudo nix flake update
cd START_DIR || exit 1
