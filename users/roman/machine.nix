# This file is an entry to the system settings.

{ pkgs, ... }: {
  # Nix is installed separately, so tell nix-darwin to not manage it. 
  # nix.useDaemon = true;
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = ''
    nix-command flakes repl-flake
  '';
  # nix.package = pkgs.nixUnstable;

  # zsh is default shell on macOS, make sure that it is configured properly with
  # nix-darwin.
  programs.zsh = {
    enable = true;
    shellInit = ''
      # Nix
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
      # End Nix
    '';
  };

  programs.fish = {
    enable = true;
    shellInit = ''
      # Nix
      if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
        source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
      end
      # End Nix
    '';
  };

  environment.shells = with pkgs; [ bashInteractive zsh fish ];
}
