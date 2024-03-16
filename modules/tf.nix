{pkgs, ...}: {
  home.packages = with pkgs; [
    opentofu
    hclfmt # HCL formatting
  ];

  programs.zsh.shellAliases = {
    tf = "tofu";
    terraform = "tofu";
  };
}
