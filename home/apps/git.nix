# Git configuration
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    
    # 使用新的 settings 格式
    settings = {
      user = {
        name = "Destin";
        email = "yuymay27@gmail.com";
      };
      
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
      
      # Git aliases for convenience
      alias = {
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        lg = "log --oneline --graph --decorate --all";
        last = "log -1 HEAD";
        unstage = "reset HEAD --";
      };
    };
  };

  # 覆盖已存在的配置文件
  xdg.configFile."git/config".force = true;
}
