# Fastfetch configuration
{ config, pkgs, ... }:

{
  # Link NixOS logo for fastfetch
  home.file.".config/fastfetch/nixos-logo.png" = {
    source = ../../. + "/NixOS Logo/nix-snowflake-rainbow.png";
    force = true;
  };
  
  # Fastfetch configuration
  home.file.".config/fastfetch/config.jsonc" = {
    force = true;
    text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "type": "kitty",
        "source": "~/.config/fastfetch/nixos-logo.png",
        "width": 38,
        "height": 17
      },
      "display": {
        "constants": [
          "██ "
        ]
      },
      "modules": [
        // User info
        {
          "type": "users",
          "key": "{$1}User",
          "keyColor": "38;5;226",
          "myselfOnly": true,
          "format": "{name}"
        },
        // System info
        {
          "key": "{$1}Distro",
          "keyColor": "38;5;214",
          "type": "os"
        },
        {
          "key": "{$1}Kernel",
          "keyColor": "38;5;203",
          "type": "kernel"
        },
        {
          "type": "disk",
          "key": "{$1}OS Age",
          "keyColor": "38;5;207",
          "condition": { "!system": "macOS" },
          "folders": "/",
          "format": "{create-time:10} [{days} days]"
        },
        {
          "key": "{$1}Shell",
          "keyColor": "38;5;135",
          "type": "shell"
        },
        {
          "key": "{$1}Terminal",
          "keyColor": "38;5;99",
          "type": "terminal"
        },
        {
          "key": "{$1}Packages",
          "keyColor": "38;5;63",
          "type": "packages"
        },
        {
          "key": "{$1}WM",
          "keyColor": "38;5;39",
          "type": "wm"
        },
        // Hardware info
        {
          "type": "chassis",
          "key": "{$1}Chassis Type",
          "keyColor": "38;5;45"
        },
        {
          "key": "{$1}CPU",
          "keyColor": "38;5;51",
          "type": "cpu",
          "format": "{name} [{cores-physical}C / {cores-logical}T] @ {freq-max}",
          "showPeCoreCount": false
        },
        // Smart GPU display
        {
          "type": "gpu",
          "key": "{$1}GPU",
          "keyColor": "38;5;82",
          "driverSpecific": true,
          "condition": { "system": "windows" },
          "format": "{name} [{type}] — {vendor} Driver: {driver}"
        },
        {
          "type": "gpu",
          "key": "{$1}GPU",
          "keyColor": "38;5;82",
          "driverSpecific": true,
          "condition": { "system": "linux" },
          "format": "{name} [{type}] - {driver}"
        },
        {
          "type": "gpu",
          "key": "{$1}GPU",
          "keyColor": "38;5;82",
          "driverSpecific": true,
          "condition": { "system": "macOS" },
          "format": "{name} [{type}]"
        },
        {
          "type": "display",
          "key": "{$1}Monitor ({name})",
          "keyColor": "38;5;118",
          "format": "{width}x{height} @ {refresh-rate} Hz - {physical-width}x{physical-height} mm ({inch} inches, {ppi} ppi)"
        },
        {
          "key": "{$1}Memory",
          "keyColor": "38;5;154",
          "type": "memory"
        },
        {
          "type": "disk",
          "key": "{$1}Disk (/)",
          "keyColor": "38;5;148",
          "folders": "/",
        },
        {
          "type": "sound",
          "key": "{$1}Sound",
          "keyColor": "38;5;190"
        },
        // Status & Network
        {
          "type": "uptime",
          "format": "{?days}{days}d {?}{hours}h {minutes}m",
          "key": "{$1}Uptime",
          "keyColor": "38;5;226"
        },
        {
          "type": "localip",
          "key": "{$1}Local IP",
          "keyColor": "38;5;214",
          "format": "{ipv4} ({ifname})"
        },
        {
          "type": "publicip",
          "key": "{$1}Public IPv4",
          "keyColor": "38;5;208",
          "ipv6": false,
          "format": "{ip}  [{location}]"
        },
        {
          "type": "dns",
          "key": "{$1}DNS",
          "keyColor": "38;5;135",
          "showType": "ipv4"
        },
        {
          "type": "media",
          "key": "{$1}Media",
          "keyColor": "38;5;39"
        },
        {
          "type": "datetime",
          "key": "{$1}Fetched",
          "keyColor": "38;5;244",
          "format": "{year}-{month-pretty}-{day-pretty} {hour-pretty}:{minute-pretty}:{second-pretty} {timezone-name}"
        }
      ]
    }
  '';
  };
}
