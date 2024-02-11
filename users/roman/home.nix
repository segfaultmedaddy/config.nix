{ pkgs, ... }: {
  # homebrew = {
  #   enable = true;
  #   casks = [
  #   "google-chrome"
  #   "discord"
  #   ];
  # };

  services.nix-daemon.enable = true;
  nix.useDaemon = true;
  nix.settings.experimental-features = "nix-command flakes repl-flake";
  
  # Load environment variables from $(cwd)/.env
  # see https://direnv.net/
  # programs.direnv.enable = true;
  # programs.direnv.nix-direnv.enable = true;

  programs.zsh.enable = true;
  programs.fish.enable = true;
  # programs.neovim.enable = true;


  users.users.roman = {
    home = "/Users/roman";
    shell = pkgs.fish;
  };
}
