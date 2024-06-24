{ pkgs, ... }: {
  home.packages = with pkgs; [
    lima-bin # container runtime. Installs nerdctl as well.
    qemu
  ];

  programs.zsh.shellAliases = {
    nerd = "lima nerdctl";
    nerdctl = "lima nerdctl";
    necu = "lima nerdctl compose up";
    necd = "lima nerdctl compose down";
    necr = "lima nerdctl compose";
  };
}
