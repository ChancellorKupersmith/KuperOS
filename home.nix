{ config, pkgs, inputs, username,
  gtkThemeFromScheme, ... }:
let 
  inherit (import ./options.nix)
    gitUsername gitEmail theme browser 
    wallpaperDir wallpaperGit flakeDir 
    waybarStyle;
in {
  # Home Manager Settings
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.11";
  
  # Add Directories to PATH
  home.sessionPath = [
    "$HOME/.dotfiles/os_scripts"
    # To run cargo installed binaries
    # "$HOME/.cargo/bin"
    # Resolves rustup binaries not being recognized (ex: rust-lldb)
    # "$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin"
  ];
  # Set The Colorscheme
  colorScheme = inputs.nix-colors.colorSchemes."${theme}";

  # Import Program Configurations
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    inputs.hyprland.homeManagerModules.default
    ./config/home
    inputs.hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1;
  ];

  # Define Settings For Xresources
  xresources.properties = {
    "Xcursor.size" = 24;
  };

  # Install & Configure Git
  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";
  };

  # Enable direnv
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    #enableFishIntegration = true;
    nix-direnv.enable = true;
  };

  # Create XDG Dirs
  xdg = {
    userDirs = {
        enable = true;
        createDirectories = true;
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  programs.home-manager.enable = true;
}
