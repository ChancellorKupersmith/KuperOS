{ pkgs, ... }:

pkgs.writeShellScriptBin "home-rebuild" ''
  pushd
  cd /home/kuper/.dotfiles/KuperOS
  home-manager switch -f home.nix
  popd | cd
''
