{ pkgs }:

pkgs.writeShellScriptBin "dvt" ''
  nix flake init -t github:ChancellorKupersmith/nix-dev-templates#$1
  direnv allow
''
