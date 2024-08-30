# This file is an entry to the system settings.

{ pkgs, ... }: {
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

  users.users.roman = {
    home = "/Users/roman";
    shell = pkgs.zsh;
  };
}
