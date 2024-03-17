{config, ...}: {
  programs.btop = {
    enable = true;
  };

  programs.zsh.shellAliases = {
    htop = "btop";
    top = "btop";
  };
}
