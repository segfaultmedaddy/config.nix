{
  user,
  machine,
  system,
  inputs,
}:
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

  imports = [
    inputs.agenix.darwinModules.default
    inputs.home-manager.darwinModules.home-manager

    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = {
        inherit system machine user;
      };

      home-manager.users.${user} = {
        imports = [
          inputs.nix-index-database.hmModules.nix-index
          inputs.agenix.homeManagerModules.default
          ./home.nix
        ];
      };
    }

    ../font/darwin.nix
    ../1password/darwin
    ../aerospace/darwin.nix
    ../wezterm/darwin.nix
    ../zed/darwin.nix
  ];

  homebrew = {
    enable = true;

    masApps = {
      Xcode = 497799835;
      Flow = 1423210932; # pomodoro timer
      "DigiDoc4 Client" = 1370791134;
      "Web eID" = 1576665083;
    };

    casks = [
      "slack"
      "google-chrome"
      "spotify"
      "discord"
      "vlc"
      "telegram"
      "cloudflare-warp"
      "beekeeper-studio"
      "tailscale"
    ];
  };
}
