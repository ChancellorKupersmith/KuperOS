{ pkgs, ... }:

pkgs.writeShellScriptBin "os-rebuild" ''
  pushd
  cd /home/kuper/.dotfiles/KuperOS
  sudo nixos-rebuild switch --flake .#nixos
  popd | cd
''
