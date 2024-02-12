{ pkgs, ... }: {
  home.stateVersion = "23.11";
 
  # Tell home-manager to manage itself.
  programs.home-manager.enable = true;

  # home.packages = with pkgs; [];

  # Load environment variables from $(cwd)/.env
  # see https://direnv.net/
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };


  programs.htop.enable = true;
  programs.awscli.enable = true;
}
