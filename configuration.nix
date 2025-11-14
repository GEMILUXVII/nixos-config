# Main NixOS configuration entry point
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/system/boot.nix
    ./modules/system/nix.nix
    ./modules/system/networking.nix
    ./modules/system/localization.nix
    ./modules/system/users.nix
    ./modules/system/services.nix
    ./modules/desktop/desktop.nix
    ./modules/desktop/programs.nix
    ./modules/desktop/packages.nix
    ./modules/desktop/steam.nix
    ./modules/hardware/nvidia.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "25.05";
}
