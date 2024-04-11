{ pkgs, ... }: {
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

  programs.git = {
    enable = true;
    userName = "Roman Vanesyan";
    userEmail = "roman@vanesyan.com";

    aliases = {
      co = "checkout";
      c = "commit";
      fr = "!git fetch origin \${1:-main} && git rebase -i \${1:-main}";
    };

    extraConfig = {
      core = {
        editor = "nvim";
        untrackedCache = true;
        whitespace = "space-before-tab,trailing-space";
        autocrlf = "input";
      };

      rebase = {
        # Always update all children branches of the current one when rebasing.
        updateRefs = true;
      };

      color.ui = "auto";
      diff.renames = "copies";
      help.autoCorrect = "1";
      log.merge = true;
      push = {
        default = "simple";
        autoSetupRemote = true;
        gpgSign = "if-asked";
      };

      url."git@github.com:" = {
        insteadOf = "https://github.com/";
        pushInsteadOf = "git://github.com/";
      };

      url."git@gist.github.com:" = {
        insteadOf = "https://gist.github.com/";
        pushInsteadOf = "git://gist.github.com/";
      };
    };
  };

  programs.zsh.shellAliases = {
    gc = "git commit";
    ga = "git add";
    gf = "git pull";
    gp = "git push";
    gs = "git status";
  };
}
