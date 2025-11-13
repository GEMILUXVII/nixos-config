# Home Manager configuration
{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./programs.nix
    ./fastfetch.nix
    ./zsh.nix
    ./starship.nix
  ];

  # User info
  home.username = "destin";
  home.homeDirectory = "/home/destin";

  # Link config files to home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # Recursively link folder contents
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;
  #   executable = true;
  # };

  # Define file content inline
  # home.file.".xxx".text = ''
  #   content here
  # '';

  # Home Manager release version
  home.stateVersion = "25.05";
}
