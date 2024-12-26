{
  user,
  machine,
  system,
  inputs,
}:
{ pkgs, ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.dart.overlays.default
      (import inputs.rust)
    ] ++ import ../../lib/overlays.nix;
    hostPlatform = "${system}";
  };

  imports = [
    ./nix.nix
    ./settings.nix

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

  environment.shells = with pkgs; [
    bashInteractive
    zsh
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
