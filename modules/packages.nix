# System-wide packages
{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # System tools
    lshw
    git
    zsh
    fastfetch
    
    # Applications
    steam
    v2raya
    qq
    qqmusic
    splayer
    wechat
    aegisub
    google-chrome
    ghostty
    telegram-desktop
    obs-studio
    vscode
  ];
}
