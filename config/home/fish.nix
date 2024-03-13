{ config, lib, pkgs, ... }:
let
  palette = config.colorScheme.palette;
in {
  programs.fish = {
    enable = true;
    shellAliases = {
      v = "getThis-windowSize | xargs -I '{}' neovide --grid {}";
      sv = "sudo vi";
      "os-rebuild" = "sudo source $HOME/.dotfiles/os_scripts/os-rebuild.sh";
      "os-update" = "sudo source $HOME/.dotfiles/os_scripts/os-update.sh"; 
      "getThis-windowSize" = "$HOME/.dotfiles/os_scripts/getThis-windowSize.sh";
      jot = "$HOME/.dotfiles/os_scripts/jot.sh";
      whatsong = "$HOME/.dotfiles/os_scripts/whatsong.sh";
      gcCleanup = "sudo nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
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
