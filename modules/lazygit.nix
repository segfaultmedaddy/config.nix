{ pkgs, ... }: {
  programs.lazygit = {
    enable = true;
    package = pkgs.lazygit;
    settings = { };
  };

  programs.zsh.shellAliases = {
    lg = "lazygit";
  };
}
