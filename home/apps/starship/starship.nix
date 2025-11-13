# Starship configuration
{ config, pkgs, ... }:

{
  # Starship prompt configuration
  home.file.".config/starship.toml" = {
    force = true;
    text = ''
      # Get editor completions based on the config schema
      "$schema" = 'https://starship.rs/config-schema.json'

      # Power10k-inspired prompt
      # Two line prompt, no background in top line, separators on left side

      # Customizing the prompt
      # ╭╴ # \u256D\u2574
      # ╰╴ # \u2570\u2574
      format = """
      [\u256D\u2574](fg:greydimmed)\
      $os\
      $shell\
      $username\
      $hostname\
      $sudo\
      $directory\
      $direnv\
      $php\
      $python\
      $git_branch$git_commit$git_state$git_metrics$git_status\
      [ ](fg:greydarker)\
      $fill\
      $fill\
      $status\
      $jobs\
      $memory_usage\
      $cmd_duration\
      $battery\
      $time\
      $line_break\
      \
      [\u2570\u2574](fg:greydimmed)\
      [$character]($style)"""

      # Move the rest of the prompt to the right
      right_format = """
      [$localip]($style)"""

      # Inserts a blank line between shell prompts
      add_newline = true

      # Color Palette
      palette = "Power10"

      [palettes.Power10]
      greydimmed = '#424242'
      greydarker = '#242424'
      ossymbol = '#AAAAAA'
      user = 'green'
      userroot = 'red'
      sshsymbol = 'green'
      hostname = 'green'
      sudo = 'red'
      directory = 'cyan'
      php = '#7a86b8'
      python = 'yellow'
      orangegit = '#E04D27'
      conflicted = 'red'
      ahead = 'yellow'
      behind = 'yellow'
      diverged = 'yellow'
      uptodate = 'green'
      untracked = 'red'
      stashed = '#A52A2A'
      modified = '#C8AC00'
      staged = 'green'
      renamed = 'yellow'
      deleted = 'orange'
      jobs = 'blue'
      memory = 'purple'
      duration = 'yellow'
      fill = '#424242'
      status = 'red'
      localip = 'green'
      shell = '#424242'

      [os]
      format = "[$symbol]($style)()"
      style = "ossymbol"
      disabled = false

      [os.symbols]
      NixOS = "\uf313 "
      Linux = "\uf17c "
      Macos = "\uf302 "
      Windows = "\uf17a "
      Ubuntu = "\uf31b "
      Arch = "\uf303 "
      Debian = "\uf306 "
      Fedora = "\uf30a "

      [shell]
      format = '[$indicator]($style)()'
      style = 'fg:shell'
      zsh_indicator = '%_ '
      bash_indicator = '\$_ '
      fish_indicator = '>> '
      powershell_indicator = '>_ '
      unknown_indicator = '?_ '
      disabled = true

      [username]
      format = "[\ueab6 ](fg:user bold)[$user]($style)[ ]()"
      style_user = 'fg:user bold'
      style_root = 'fg:userroot bold'
      show_always = false
      disabled = false

      [hostname]
      format = '[$ssh_symbol ](fg:sshsymbol bold)[$hostname](fg:hostname bold)[ ]()'
      ssh_only = true
      ssh_symbol = "\ue36e"
      disabled = false

      [sudo]
      format = "[\ueab6 ](fg:sudo bold)[as $symbol]($style)"
      style = 'fg:red bold'
      symbol = "\uf007! "
      disabled = false

      [directory]
      format = "[\ueab6 ](fg:directory bold)[$read_only]($read_only_style)[$repo_root]($repo_root_style)[$path ]($style)"
      style = 'fg:directory bold'
      home_symbol = "\uf015 ~"
      read_only = "\uf023 "
      read_only_style = 'fg:directory'
      truncation_length = 3
      truncation_symbol = '…/'
      truncate_to_repo = true
      repo_root_format = "[\ueab6 ](fg:directory bold)[$read_only]($read_only_style)[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path ]($style)"
      repo_root_style = 'fg:directory bold'
      use_os_path_sep = true
      disabled = false

      [direnv]
      symbol = 'direnv'
      style = 'fg:greydimmed'
      format = "[\u3009$symbol $loaded/$allowed ]($style)"
      allowed_msg = 'a'
      not_allowed_msg = '!a'
      denied_msg = 'x'
      loaded_msg = '+'
      unloaded_msg = '-'
      disabled = false

      [php]
      format = " [\u3009[$symbol](php italic)($version )]($style)"
      style = 'fg:php'
      symbol = "php "

      [python]
      format = "[\u3009''${symbol}''${pyenv_prefix}((''${version} ))((''$virtualenv) )]($style)"
      style = 'fg:python'
      symbol = "\ue73c "
      pyenv_version_name = true

      [git_branch]
      format = "[\u3009$symbol $branch(:$remote_branch)]($style)[ ]()"
      style = 'fg:orangegit'
      symbol = "\ue702"

      [git_commit]
      format = '[(\(''${hash}''${tag}\))]($style)[ ]()'
      style = 'fg:orangegit'
      commit_hash_length = 8
      tag_symbol = " \uf412 "
      tag_disabled = false
      disabled = false

      [git_metrics]
      format = '[\[+''${added}/]($added_style)[-''${deleted}\]]($deleted_style)[ ]()'
      added_style = 'fg:orangegit'
      deleted_style = 'fg:orangegit'
      disabled = false

      [git_status]
      format = '([$all_status$ahead_behind]($style))'
      style = 'fg:orangegit'
      conflicted = "[\ueaaf''${count} ](fg:conflicted)"
      ahead = "[\u21E1''${count} ](fg:ahead)"
      behind = "[\u21E3''${count} ](fg:behind)"
      diverged = "[\u2195\u21E1''${ahead_count} \u21E3''${behind_count} ](fg:diverged)"
      up_to_date = "[\u2714 ](fg:uptodate)"
      untracked = "[󰟉''${count} ](fg:untracked)"
      stashed = "[\ueb29''${count} ](fg:stashed)"
      modified = "[\uf040''${count} ](fg:modified)"
      staged = "[\u26DF+''${count} ](fg:staged)"
      renamed = "[\u0373''${count} ](fg:renamed)"
      deleted = "[\uea81''${count} ](fg:deleted)"
      disabled = false

      [fill]
      style = 'fg:fill'
      symbol = "\u2500"

      [status]
      format = "[$symbol $status ''${hex_status}( \uf0a2 ''${signal_number}-''${signal_name})]($style)"
      style = 'fg:status'
      symbol = " \u2717"
      disabled = false

      [jobs]
      format = "[ \ueab5 ](fg:jobs bold)[$symbol $number]($style)"
      style = 'fg:jobs'
      symbol = "\ueb7b"
      symbol_threshold = 1
      number_threshold = 2
      disabled = false

      [memory_usage]
      format = "[ \ueab5 ](fg:memory bold)[$symbol ''${ram} ''${swap}]($style)"
      style = "fg:memory"
      symbol = "\ueb50 \uebcb"
      threshold = 75
      disabled = false

      [cmd_duration]
      format = "[ \ueab5 \uf017 $duration]($style)"
      style = 'fg:duration'
      min_time = 500
      disabled = false

      [battery]
      format = "[ \ueab5 $symbol$percentage]($style)"
      full_symbol = '󰁹 '
      charging_symbol = '󰂄 '
      discharging_symbol = '󰂃 '
      unknown_symbol = '󰁽? '
      empty_symbol = '󰂎 '
      disabled = true

      [[battery.display]]
      threshold = 100
      style = 'fg:greydimmed'

      [time]
      format = "[ \ueab5 $time]($style)"
      style = 'fg:greydimmed'
      disabled = true

      [localip]
      format = '[$localipv4](fg:localip bold)'
      ssh_only = true
      disabled = false
    '';
  };
}
