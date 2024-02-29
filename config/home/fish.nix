{ config, lib, pkgs, ... }:
let
  palette = config.colorScheme.palette;
in {
  programs.fish = {
    enable = true;
    shellAliases = {
      v = "neovide";
      sv = "sudo vi";
      "os-rebuild" = "sudo ~/.dotfiles/KuperOS/config/scripts/os-rebuild.sh";
      "home-rebuild" = "~/.dotfiles/KuperOS/config/scripts/home-rebuild.sh";
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
