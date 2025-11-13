# Network configuration
{ config, pkgs, ... }:

{
  networking.hostName = "nixos";
  
  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";

  # DNS setting: Aliyun DNS
  networking.nameservers = [ "223.5.5.5" "223.6.6.6" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
