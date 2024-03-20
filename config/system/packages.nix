{ pkgs, config, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List System Programs
  environment.systemPackages = with pkgs; [
    # CLI TOOLS
    fzf
    gawk ripgrep
    direnv
    pandoc
    lsd
    lshw
    wget curl
    neofetch
    htop btop
    unzip unrar
    toybox

    # Terminals
    lolcat

    # GIT
    git gh git-crypt
    # Security
    pinentry-qt
    fprintd
    keepassxc
    pwgen
    gnupg
    sops
    
    # System
    libvirt
    polkit_gnome
    lm_sensors
    libnotify
    eza
    v4l-utils
    ydotool
    wl-clipboard
    socat  
    pkg-config
    symbola    
    noto-fonts-color-emoji
    material-icons
    brightnessctl
    virt-viewer
    swappy
    appimage-run 
    networkmanagerapplet
    yad
    playerctl
    nh
    autoconf
    cudatoolkit
    procps
    util-linux
    m4
    gperf
    linuxPackages.nvidia_x11
    libGLU libGL
    xorg.libXi xorg.libXmu freeglut
    xorg.libXext xorg.libX11 xorg.libXv xorg.libXrandr zlib 
    ncurses5 stdenv.cc binutils
    wireplumber_0_4_17

    # Development
    ollama
    (llama-cpp.override { cudaSupport = true; cudaPackages = cudaPackages; })
    python311Packages.huggingface-hub
    go
    libgcc
    grpc
    cmake
    #meson
    #hugo
    gnumake
    #ninja
  ];
  

  programs = {
    steam.gamescopeSession.enable = true;
    dconf.enable = true;
    seahorse.enable=true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    virt-manager.enable = true;
  };

  virtualisation.libvirtd.enable = true;
}
