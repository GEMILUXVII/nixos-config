# System-wide packages
{ config, pkgs, ... }:

{
  # System-level packages
  # User applications should be installed via Home Manager
  environment.systemPackages = with pkgs; [
    # System tools
    lshw
    git
    zsh

    # System services
    v2raya

  ];
}
