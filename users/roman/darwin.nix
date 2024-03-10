# This file is an entry to all macOS specific settings, programs, etc.

{ config, lib, pkgs, customPkgs, ... }: {
  imports = [ ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = import ../../lib/overlays.nix;

  environment.systemPackages = with pkgs; [
    neofetch
    neovim
    ripgrep # faster grep
    tree # file tree view
    xsel # clipboard support
    curl
    wget
    jq # JSON query utility
    age # tool to encrypt content
    coreutils-full
  ];

  homebrew = {
    enable = true;
    casks = [
      "google-chrome"
      "spotify"
      "discord"
      "wezterm"
      "vlc"
      "transmission"
      "1password"
      "1password-cli"
      "telegram"
    ];
  };

  fonts = {
    fontDir.enable = true;
    fonts = [ ];
  };

  system.defaults.dock = {
    show-recents = false;
    orientation = "bottom";
    autohide = false;
    magnification = false;
  };

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

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
  };

  # Enable sudo via TouchID or Apple Watch.
  security.pam.enableSudoTouchIdAuth = true;

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  users.users.roman = {
    home = "/Users/roman";
    shell = pkgs.zsh;
  };
}
