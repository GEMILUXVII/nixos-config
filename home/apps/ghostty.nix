# Ghostty terminal configuration
{ config, pkgs, ... }:

{
  # Ghostty terminal emulator configuration
  home.file.".config/ghostty/config" = {
    force = true;
    text = ''
      # Ghostty Configuration
      # https://ghostty.org/docs/config

      # Theme
      theme = Carbonfox

      # Font
      font-size = 15

      # Cursor
      adjust-cursor-thickness = 3
      adjust-underline-position = 3
      cursor-invert-fg-bg = true
      cursor-opacity = 0.8
      cursor-style = bar

      # Text rendering
      bold-is-bright = true

      # Mouse & Links
      link-url = true
      mouse-hide-while-typing = true

      # Window
      window-vsync = true
      background-blur = true
      # background-opacity = 0.9
      # window-padding-x = 2
      
      # Start with maximized window
      window-width = 120
      window-height = 40
    '';
  };
}
