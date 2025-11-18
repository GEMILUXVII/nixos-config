# User account configuration
{ config, pkgs, ... }:

{
  # Set default user shell
  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.destin = {
    isNormalUser = true;
    description = "Destin";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    useDefaultShell = true;
    packages = with pkgs; [
      kdePackages.kate
      # thunderbird
    ];
  };
}
