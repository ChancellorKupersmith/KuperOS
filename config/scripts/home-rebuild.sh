#!/bin/sh
pushd
cd /home/kuper/.dotfiles/KuperOS
home-manager switch -f home.nix
popd | cd
