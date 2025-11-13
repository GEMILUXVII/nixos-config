# NVIDIA GPU configuration for laptop
{ config, pkgs, ... }:

{
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Configure the NVIDIA driver
  hardware.nvidia = {
    open = true;
    
    prime = {
      sync.enable = true;
      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # Load the nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];
}
