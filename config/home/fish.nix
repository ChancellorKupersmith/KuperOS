{ config, lib, pkgs, ... }:
let
  palette = config.colorScheme.palette;
in {
  programs.fish = {
    enable = true;
    shellAliases = {
      v = "neovide";
      sv = "sudo vi";
      "os-rebuild" = ''
        pushd
        cd /home/kuper/.dotfiles/KuperOS
        sudo nixos-rebuild switch --flake .#nixos
        popd | cd
      ''; 
      "os-update" = "sudo nix-channel --update"; 
      gcCleanup = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      ls = "lsd";
      ll = "lsd -l";
      la = "lsd -a";
      lal = "lsd -al";
      ".." = "cd ..";
      neofetch = "neofetch --ascii ~/.config/ascii-neofetch";
    };
    functions = {
      fish_prompt = ''
        set_color $fish_color_cwd
        echo -n (prompt_pwd)
        set_color normal
        echo -n ' > '
        '';
        fish_greeting = "";
    };
  };
}
