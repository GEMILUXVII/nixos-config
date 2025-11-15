# User-specific packages via Home Manager
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # File management
    yazi # terminal file manager
    
    # Archives
    zip
    xz
    unzip
    p7zip

    # CLI utilities
    eza # modern replacement for 'ls'
    glow # markdown previewer
    fastfetch # system info

    # Nix tools
    nix-output-monitor # enhanced nix output with 'nom' command

    # Monitoring
    btop # system monitor
    iotop # I/O monitor
    iftop # network monitor

    # Debugging
    strace # system call tracer
    ltrace # library call tracer
    lsof # list open files

    # System tools
    sysstat
    lm_sensors # hardware sensors
    ethtool
    pciutils # lspci
    usbutils # lsusb
    
    # Development
    vscode
    zig
    zls
    
    # Terminal
    ghostty
    
    # Browsers
    google-chrome
    microsoft-edge
    
    # Communication
    telegram-desktop
    qq
    wechat
    
    # Media
    qqmusic
    splayer
    obs-studio
    aegisub

    # Mail Client
    thunderbird
  ];
}
