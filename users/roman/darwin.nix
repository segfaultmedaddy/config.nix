{ config, pkgs, ... }: {
  # NOTE: this file is managed by nix-darwin.

  # homebrew = {
  #   enable = true;
  #   casks = [
  #   "google-chrome"
  #   "discord"
  #   ];
  # };

  # Tell Nix 
  nix.useDaemon = true;
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes repl-flake";
  nix.package = pkgs.nixUnstable;

  programs.zsh.enable = true;
  programs.zsh.shellInit = ''
    # Nix
    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi
    # End Nix
    '';

  programs.fish.enable = true;
  programs.fish.shellInit = ''
    # Nix
    if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
      source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
    end
    # End Nix
    '';

  environment.systemPackages = with pkgs; [ zsh fish ];

  users.users.roman = {
    home = "/Users/roman";
    shell = pkgs.fish;
  };
}
