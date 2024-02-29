#!/bin/sh
pushd
cd /home/kuper/.dotfiles/KuperOS
sudo nixos-rebuild switch --flake .#nixos
popd | cd
