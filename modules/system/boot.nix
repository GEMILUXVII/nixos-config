# Boot loader configuration
{ config, pkgs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    devices = [ "nodev" ];
    useOSProber = true;
    # gfxmodeEfi = "1920x1200,auto";
    configurationLimit = 7;

    default = "Windows Boot Manager (on /dev/nvme1n1p1)";
  };

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
