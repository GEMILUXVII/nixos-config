# Steam configuration with Chinese language support
{ config, pkgs, ... }:

{
  # Enable Steam with proper configuration
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    
    # Additional packages for Steam
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # Environment variables for Steam Chinese support
  environment.sessionVariables = {
    # Force Steam to use system locale
    STEAM_RUNTIME_PREFER_HOST_LIBRARIES = "0";
    # Ensure proper font rendering
    FREETYPE_PROPERTIES = "truetype:interpreter-version=38";
  };

  # Hardware acceleration for Steam
  hardware.graphics = {
    enable32Bit = true;
  };
}
