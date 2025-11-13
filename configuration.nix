# Main NixOS configuration entry point
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/nix.nix
    ./modules/networking.nix
    ./modules/localization.nix
    ./modules/desktop.nix
    ./modules/hardware/nvidia.nix
    ./modules/programs.nix
    ./modules/services.nix
    ./modules/users.nix
    ./modules/packages.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "25.05";
}
