# System services configuration
{ config, pkgs, ... }:

{
  # V2raya
  services.v2raya.enable = true;

  # Enable the OpenSSH daemon
  # services.openssh.enable = true;
}
