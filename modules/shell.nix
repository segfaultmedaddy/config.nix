{
  pkgs,
  inputs,
  ...
}:
{
  imports = [ ./atuin.nix ];

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
    coreutils-full
    pv
    # ast-grep # grep for code # activate once ast-grep is 0.41.1
    asciinema # terminal recording
    asciinema-agg # convert ascii scene to gif
    ffmpeg # video processing
    pdfcpu # pdf manipulation
    age # tool to encrypt content
    dive # docker image explorer
    devenv # the best dev env manager ever
    mise # yet another package manager
  ];

  programs.zsh = {
    enable = true;

    # Source a machine-local, un-tracked config file if it exists. This allows
    # per-machine customizations without committing them to the repo.
    initContent = ''
      [[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
    '';

    shellAliases = {
      ll = "ls -la";
      ".." = "z ..";
      "..." = "z ../..";

      # TODO(segfaultmedaddy): maybe we should disable the override on linux?
      cat = "bat";
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

  # cat clone with syntax highlighting
  programs.bat.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [ "--disable-up-arrow" ];
    package = inputs.atuin.packages.${pkgs.stdenv.hostPlatform.system}.default;
    # atuin only ships a V1 OpenCode plugin; re-enable once V2 support lands
    # (atuinsh/atuin#4116, #4077).
    opencode.enable = false;
    settings = {
      enter_accept = false;
      update_check = false;
      workspaces = true;
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    # Allow extra impure configs to be included.
    includes = [ "config.d/*" ];
  };

  programs.btop = {
    enable = true;
  };
  programs.zsh.shellAliases.htop = "btop";
  programs.zsh.shellAliases.top = "btop";

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
    silent = true;
  };

  programs.starship = {
    enable = true;
  };

  home.file.".fdignore".text = ''
    .git
  '';
}
