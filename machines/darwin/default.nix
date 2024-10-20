# This file is an entry to the system settings.

{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = import ../../lib/overlays.nix;

  services.nix-daemon.enable = true;
  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 1;
      Hour = 0;
      Minute = 0;
    };
    options = "--delete-older-than 30d";
  };

  nix.settings.experimental-features = ''
    nix-command flakes
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

  environment.shells = with pkgs; [
    bashInteractive
    zsh
  ];

  system.defaults.dock = {
    show-recents = false;
    orientation = "bottom";
    autohide = true;
    magnification = false;
  };

  system.defaults.CustomSystemPreferences = {
    # Increase key repeat rate. It helps with typing faster in neovim.
    "NSGlobalDomain" = {
      "InitialKeyRepeat" = 15;
      "KeyRepeat" = 2;
    };
  };

  # Disable long animation for tails switching.
  system.defaults.universalaccess.reduceMotion = true;
  system.defaults.universalaccess.reduceTransparency = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
  };

  # Enable sudo via TouchID or Apple Watch.
  security.pam.enableSudoTouchIdAuth = true;

  # Enable home brew on the device.
  homebrew.enable = true;
}
