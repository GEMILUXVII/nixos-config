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
      font-family = "Maple Mono NF"
      font-size = 15

      # Cursor
      adjust-cursor-thickness = 3
      adjust-underline-position = 3
      cursor-invert-fg-bg = true
      cursor-opacity = 0.8
      cursor-style = bar

      # Text rendering
      bold-is-bright = true

      # Terminal type - use xterm-256color for better compatibility
      term = xterm-256color

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

      # Some shaders can be found in this repo, they're usually uploaded to discord
      # https://github.com/hackrmomo/ghostty-shaders
      # custom-shader = shaders/bloom.glsl
      # custom-shader = shaders/bloom1.glsl
      # custom-shader = shaders/bloom075.glsl
      # custom-shader = shaders/bloom060.glsl
      # custom-shader = shaders/bloom050.glsl
      # custom-shader = shaders/bloom025.glsl
      # custom-shader = shaders/cubes.glsl
      # custom-shader = shaders/starfield-colors.glsl
      # custom-shader = shaders/starfield.glsl
      # custom-shader = shaders/cursor_shaders/cursor_blaze.glsl
      # custom-shader = shaders/cursor_shaders/cursor_blaze_no_trail.glsl
      # custom-shader = shaders/cursor_shaders/cursor_smear.glsl
      # custom-shader = shaders/cursor_shaders/cursor_smear_fade.glsl
      custom-shader = shaders/cursor_shaders/cursor_warp.glsl
    '';
  };

  # Copy shaders directory
  home.file.".config/ghostty/shaders" = {
    source = ./shaders;
    recursive = true;
  };
}
