{
  user,
  machine,
  inputs,
  isDeterminate,
  hasMasSupport ? true,
  ...
}:
{ pkgs, ... }:
{
  imports = [
    (if isDeterminate then inputs.determinate.darwinModules.default else { })
    (import ../nix/default.nix { isDarwin = true; } {
      inherit
        inputs
        user
        machine
        ;
    })

    {
      networking.hostName = "${machine}";
      system.primaryUser = "${user}";
      users.users.${user} = {
        home = "/Users/${user}";
      };

      home-manager.users.${user} = {
        imports = [
          ./home.nix
        ];
      };

      age.identityPaths = [ "/Users/${user}/.ssh/${machine}-agenix-key" ];
    }

    (
      if isDeterminate then
        {
          determinateNix = {
            enable = true;
            determinateNixd = {
              garbageCollector.strategy = "automatic";
            };
            # nix.settings is ignored by Determinate Nix, so caches must be set here too.
            customSettings = {
              extra-substituters = [
                "https://devenv.cachix.org"
                "https://vicinae.cachix.org"
              ];
              extra-trusted-public-keys = [
                "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
                "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
              ];
            };
          };
        }
      else
        {
          nix.gc = {
            automatic = true;
            interval = {
              Weekday = 1;
              Hour = 0;
              Minute = 0;
            };
            options = "--delete-older-than 30d";
          };
        }
    )

    ./settings.nix
    ../font/darwin.nix
    (import ../1password/darwin { inherit hasMasSupport; })
    ../aerospace/darwin.nix
  ];

  environment.systemPackages = [ pkgs.ghostty-bin ];

  environment.shells = with pkgs; [
    bashInteractive
    zsh
  ];

  # zsh is default shell on macOS, make sure that it is configured properly with
  # nix.
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

  homebrew = {
    enable = true;

    onActivation.autoUpdate = true;

    casks = [
      "slack"
      "spotify"
      "discord"
      "vlc"
      "telegram"
      "beekeeper-studio"
      "docker-desktop"
      "zed"
      "tailscale-app"
      "google-chrome"

      # AI
      "handy"
    ];
  }
  // (
    if hasMasSupport then
      {
        masApps = {
          Xcode = 497799835;
          DigiDoc4 = 1370791134;
          "Web eID" = 1576665083;
        };
      }
    else
      { }
  );
}
