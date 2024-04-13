{ pkgs, config, username, ... }:

let 
  inherit (import ../../options.nix) 
  browser wallpaperDir wallpaperGit flakeDir;
in {
  # Install Packages For The User
  home.packages = with pkgs; [
    pkgs."${browser}" discord libvirt swww grim slurp gnome.file-roller
    swaynotificationcenter rofi-wayland imv transmission-gtk mpv
    gimp obs-studio audacity pavucontrol tree github-desktop
    font-awesome spotify swayidle neovide element-desktop
    hypridle hyprlock google-chrome vscodium slack postman
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    tor-browser brave chromium slack
    # Import Scripts
    (import ./../scripts/jarvis-start.nix {inherit pkgs; })
    (import ./../scripts/dvt.nix { inherit pkgs; })
    (import ./../scripts/getPlayingSong.nix { inherit pkgs; })
    (import ./../scripts/emopicker9000.nix { inherit pkgs; })
    (import ./../scripts/task-waybar.nix { inherit pkgs; })
    (import ./../scripts/squirtle.nix { inherit pkgs; })
    (import ./../scripts/wallsetter.nix { inherit pkgs; inherit wallpaperDir;
      inherit username; inherit wallpaperGit; })
      (import ./../scripts/themechange.nix { inherit pkgs; inherit flakeDir; })
    (import ./../scripts/theme-selector.nix { inherit pkgs; })
    (import ./../scripts/nvidia-offload.nix { inherit pkgs; })
    (import ./../scripts/web-search.nix { inherit pkgs; })
    (import ./../scripts/rofi-launcher.nix { inherit pkgs; })
    (import ./../scripts/screenshootin.nix { inherit pkgs; })
    (import ./../scripts/list-hypr-bindings.nix { inherit pkgs; })
  ];

  programs.gh.enable = true;
}
