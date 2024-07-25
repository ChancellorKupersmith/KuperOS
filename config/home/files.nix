{ pkgs, config, ... }:

{
  # Place Files Inside Home Directory
  home.file.".emoji".source = ./files/emoji;
  home.file.".base16-themes".source = ./files/base16-themes;
  home.file.".face".source = ./files/face.jpg; # For GDM
  home.file.".face.icon".source = ./files/face.jpg; # For SDDM
  home.file.".config/rofi/rofi.png".source = ./files/rofi.png;
  home.file.".config/starship.toml".source = ./files/starship.toml;
  home.file.".config/swaylock-bg.jpg".source = ./files/media/swaylock-bg.jpg;
  home.file.".config/ascii-neofetch".source = ./files/ascii-neofetch;
  # home.file.".dotfiles/os_scripts/os-rebuild.sh" = ../scripts/os-rebuild.sh;
  # home.file.".dotfiles/os_scripts/os-update.sh" = ../scripts/os-update.sh;
  home.file.".local/share/fonts" = {
    source = ./files/fonts;
    recursive = true;
  };
  home.file.".config/obs-studio" = {
    source = ./files/obs-studio;
    recursive = true;
  };
}
