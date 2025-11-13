# Git configuration
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Destin";
    userEmail = "yuymay27@gmail.com";
    
    extraConfig = {
      core = {
        editor = "nano";
      };
      safe = {
        directory = "/etc/nixos";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = false;
      };
    };
    
    # Git aliases for convenience
    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
      ci = "commit";
      lg = "log --oneline --graph --decorate --all";
      last = "log -1 HEAD";
      unstage = "reset HEAD --";
    };
  };

  # 覆盖已存在的配置文件
  xdg.configFile."git/config".force = true;
}
