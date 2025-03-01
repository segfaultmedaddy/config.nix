{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    fastfetch # fetch system info
    ripgrep # faster grep
    fd # faster find
    tree # file tree view
    xsel # clipboard support
    curl
    wget
    jq # JSON query utility
    yq-go # like jq but for yaml
    age # tool to encrypt content
    bat # cat clone with syntax highlighting
    coreutils-full
    pv
    asciinema # terminal recording
    asciinema-agg # convert ascii scene to gif
    ast-grep # grep for code
    dive # docker image explorer
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      ".." = "z ..";
      "..." = "z ../..";
      cat = "bat";
      htop = "btop";
      top = "btop";
    };

    history = {
      size = 5000;
      save = 5000;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      share = true;
    };

    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "brackets"
      ];
    };
  };

  programs.ssh.enable = true;

  programs.btop = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
    silent = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$cmd_duration"
        "$line_break"
        "$python"
        "$character"
      ];

      right_format = lib.concatStrings [
        "$kubernetes"
      ];

      directory.style = "blue";

      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };

      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };

      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
        style = "cyan";
        conflicted = "​";
        untracked = "​";
        modified = "​";
        staged = "​";
        renamed = "​";
        deleted = "​";
        stashed = "≡";
      };

      git_state = {
        format = "([$state( $progress_current/$progress_total)]($style)) ";
        style = "bright-black";
      };

      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
      };

      kubernetes = {
        format = "[$context:$namespace]($style)";
        style = "blue";
        disabled = false;
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file.".fdignore".text = ''
    .git
  '';
}
