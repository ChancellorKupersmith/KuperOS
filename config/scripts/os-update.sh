#!/bin/sh
pushd || exit 1
cd /home/kuper/.dotfiles/KuperOS || exit 1
sudo nix flake update
(popd | cd) || exit 1
