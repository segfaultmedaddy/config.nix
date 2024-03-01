# This file is an entry to the system settings.

{ pkgs, ... }: {
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = ''
    nix-command flakes repl-flake
  '';

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

  environment.shells = with pkgs; [ bashInteractive zsh ];
}
