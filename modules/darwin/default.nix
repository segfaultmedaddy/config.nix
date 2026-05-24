{
  user,
  machine,
  inputs,
  isDeterminate,
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
    ../1password/darwin
    ../aerospace/darwin.nix
  ];

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

    masApps = {
      Xcode = 497799835;
      DigiDoc4 = 1370791134;
      "Web eID" = 1576665083;
    };

    casks = [
      "slack"
      "spotify"
      "discord"
      "vlc"
      "telegram"
      "beekeeper-studio"
      "docker-desktop"
      "zed"
      "wezterm"
      "tailscale-app"
      "google-chrome"

      # AI
      "handy"
    ];
  };
}
