{ pkgs, ... }:
{
  users.users.roman = {
    shell = pkgs.zsh;
  };

  homebrew.masApps = {
    Flow = 1423210932; # pomodoro timer
    WhatsApp = 310633997;
  };

  homebrew.casks = [
    "steam"
    "elgato-camera-hub"
    "transmission"

    # OBS
    "obs"
    "obs-advanced-scene-switcher"

    # Gaming
    "nvidia-geforce-now"

    # opencode GUI
    opencode-desktop
  ];

  system.defaults.dock.persistent-apps = [
    "/System/Applications/Calendar.app"
    "/System/Applications/Mail.app"
    "/Applications/Google Chrome.app"
    "/Applications/WezTerm.app"
    "/Applications/Zed.app"
    "/Applications/Telegram.app"
    "/Applications/Spotify.app"
  ];
}
