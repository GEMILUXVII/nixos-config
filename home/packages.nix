# User-specific packages installed via Home Manager
{ config, pkgs, ... }:

{
  # 通过 home.packages 安装一些常用的软件
  # 这些软件将仅在当前用户下可用，不会影响系统级别的配置
  # 建议将所有 GUI 软件，以及与 OS 关系不大的 CLI 软件，都通过 home.packages 安装
  home.packages = with pkgs; [
    # Terminal file manager
    nnn
    
    # Archives
    zip
    xz
    unzip
    p7zip

    # Utils
    eza # A modern replacement for 'ls'

    # Nix related
    nix-output-monitor # provides the command `nom` works just like `nix` with more details log output

    # Productivity
    glow # markdown previewer in terminal

    # Monitoring
    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # System call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # System tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];
}
