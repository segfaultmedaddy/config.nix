{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch
    ripgrep # faster grep
    fd # faster find
    tree # file tree view
    xsel # clipboard support
    curl
    wget
    jq # JSON query utility
    age # tool to encrypt content
    bat # cat clone with syntax highlighting
    coreutils-full
    pv
    asciinema # terminal recording
    asciinema-agg # convert ascii scene to gif
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
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file.".fdignore".text = ''
    .git
  '';
}
