{ pkgs, ... }:

pkgs.writeShellScriptBin "dvt" ''
  for arg in "$@"; do
    nix flake init -t github:ChancellorKupersmith/nix-dev-templates#$arg
    direnv allow
  done
''
