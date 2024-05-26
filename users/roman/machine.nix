# This file is an entry to the system settings.

{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = import ../../lib/overlays.nix;

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

  system.defaults.dock = {
    show-recents = false;
    orientation = "bottom";
    autohide = false;
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

  # local = {
  #   dock.enable = true;
  #   dock.entries = [
  #     { path ="/System/Applications/Mail.app/" }
  #     { path = "/System/Applications/Calendar.app/" }
  #     { path = "/System/Applications/Notes.app/" }
  #     { path = "/Applications/Google Chrome.app/" }
  #     { path = "/Applications/Spotify.app/" }
  #     { path = "/Applications/Telegram.app" }
  #     { path = "/Applications/WezTerm.app/" }
  #   ];
  # };

  homebrew = {
    enable = true;
    casks = [
      "google-chrome"
      "spotify"
      "discord"
      "vlc"
      "transmission" # Torrent client. Don't use in Germany, GG.
      "telegram"
      "languagetool"
      "cloudflare-warp"
      "obsidian"
    ];
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
  };

  # Enable sudo via TouchID or Apple Watch.
  security.pam.enableSudoTouchIdAuth = true;

  users.users.roman = {
    home = "/Users/roman";
    shell = pkgs.zsh;
  };
}
