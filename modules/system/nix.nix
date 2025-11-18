# Nix package manager configuration
{ config, pkgs, ... }:

{
  # Nix settings: enable flakes & substituters
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
    # Optimise storage
    auto-optimise-store = true;
  };

  # Do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable nix-ld for running dynamically linked executables (e.g., Zed editor)
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add common libraries needed by dynamically linked executables
    stdenv.cc.cc.lib
    zlib
    glib
    gtk3
    cairo
    pango
    atk
    gdk-pixbuf
    libglvnd
    fontconfig
    freetype
    dbus
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    alsa-lib
    vulkan-loader
    # Wayland support (required for Zed on Wayland)
    wayland
    libxkbcommon
  ];

  # Environment variables for external binaries (like Zed)
  environment.sessionVariables = {
    # XKB keyboard layout path for Wayland apps
    XKB_CONFIG_ROOT = "${pkgs.xkeyboard_config}/share/X11/xkb";
  };
}
