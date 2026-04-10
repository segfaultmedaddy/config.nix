{
  user,
  machine,
  inputs,
  ...
}:
{ pkgs, ... }:
{
  imports = [
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

      nix.gc = {
        automatic = true;
        interval = {
          Weekday = 1;
          Hour = 0;
          Minute = 0;
        };
        options = "--delete-older-than 30d";
      };

      home-manager.users.${user} = {
        imports = [
          ./home.nix
        ];
      };

      age.identityPaths = [ "/Users/${user}/.ssh/${machine}-agenix-key" ];
    }

    ./settings.nix
    ../font/darwin.nix
    ../1password/darwin
    ../aerospace/darwin.nix
    ../wezterm/darwin.nix
    ../zed/darwin.nix
  ];

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

  homebrew = {
    enable = true;

    masApps = {
      Xcode = 497799835;
      Flow = 1423210932; # pomodoro timer
      DigiDoc4 = 1370791134;
      "Web eID" = 1576665083;
      WhatsApp = 310633997;
    };

    casks = [
      "slack"
      "spotify"
      "discord"
      "vlc"
      "telegram"
      "cloudflare-warp"
      "beekeeper-studio"
      "languagetool-desktop"
      "obsidian"
      "cursor"

      # AI
      "handy"
    ];
  };
}
