{ ... }:
{
  system.stateVersion = 4;

  # local = {
  #   dock.enable = true;
  #   dock.entries = [
  #     { path = "/System/Applications/Mail.app/"; }
  #     { path = "/System/Applications/Calendar.app/"; }
  #     { path = "/System/Applications/Notes.app/"; }
  #     { path = "/Applications/Google Chrome.app/"; }
  #     { path = "/Applications/Spotify.app/"; }
  #     { path = "/Applications/Telegram.app"; }
  #     { path = "/Applications/WezTerm.app/"; }
  #   ];
  # };

  homebrew = {
    masApps = {
      "Adobe Lightroom" = 1451544217;
    };

    casks = [
      "transmission" # Torrent client.
      "languagetool"
      "obsidian"
      "linear-linear" # linear.app
      "notion"
      "android-studio"
    ];
  };
}
