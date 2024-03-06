#!/bin/sh
pushd
cd /home/kuper/.dotfiles/KuperOS
sudo nix flake update
popd | cd
