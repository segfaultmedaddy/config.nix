{ pkgs, ... }:
{
  home.packages = with pkgs; [
    delta # custom highlighter
  ];

  programs.git = {
    enable = true;

    aliases = {
      co = "checkout";
      swi = "!f() { git switch $1 2>/dev/null || git switch -c $1; }; f";
      c = "commit";
      fr = "!git fetch origin \${1:-main} && git rebase -i \${1:-main}";
    };

    extraConfig = {
      core = {
        editor = "nvim";
        pager = "delta";
        untrackedCache = true;
        whitespace = "space-before-tab,trailing-space";
        autocrlf = "input";
      };

      merge.conflictstyle = "diff3";

      delta = {
        side-by-side = true;
        line-numbers = true;
        hyperlinks = true;
        navigate = true;
      };

      interactive = {
        diffFilter = "delta --color-only";
      };

      rebase = {
        # Always update all children branches of the current one when rebasing.
        updateRefs = true;
      };

      color.ui = "auto";
      diff = {
        renames = "copies";
        colorMoved = "default";
      };
      help.autoCorrect = "1";
      log.merge = true;
      push = {
        default = "simple";
        autoSetupRemote = true;
        gpgSign = "if-asked";
      };

      url."ssh://git@github.com/" = {
        insteadOf = "https://github.com/";
      };

      url."ssh://git@gist.github.com/" = {
        insteadOf = "https://gist.github.com/";
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };

    settings = {
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };

  programs.lazygit = {
    enable = true;
    package = pkgs.lazygit;
    settings = { };
  };

  programs.zsh.shellAliases = {
    g = "git";
    gc = "git commit";
    ga = "git add";
    gf = "git pull";
    gp = "git push";
    gpf = "git push --force";
    gs = "git status";
    gco = "git co";
    gswi = "git swi";
    gb = "git branch";
    lg = "lazygit";
  };
}
