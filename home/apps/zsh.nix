# Zsh configuration
{ config, pkgs, ... }:

{
  # Zsh configuration file
  home.file.".zshrc" = {
    force = true;
    text = ''
      # Created by newuser for 5.9
      eval "$(starship init zsh)"
      fastfetch
    '';
  };
}
