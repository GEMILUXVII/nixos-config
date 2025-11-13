# Nix package manager configuration
{ config, pkgs, ... }:

{
  # Nix settings: enable flakes & substituters
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
    # Optimise storage
    auto-optimise-store = true;
  };

  # Do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
