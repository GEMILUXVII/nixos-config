# Zsh configuration
{ config, pkgs, ... }:

{
  # Zsh configuration file
  home.file.".zshrc" = {
    force = true;
    text = ''
      # Created by newuser for 5.9

      # Add Zed to PATH
      export PATH="$HOME/.local/bin:$PATH"

      # Initialize starship prompt
      eval "$(starship init zsh)"

      # Show system info on startup
      fastfetch
    '';
  };
}
