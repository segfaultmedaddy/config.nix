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
}
