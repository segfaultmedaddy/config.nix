{ pkgs, ... }:
{
  users.users.roman = {
    shell = pkgs.zsh;
  };

  homebrew.casks = [
    "elgato-camera-hub"
    "notion"
  ];

  system.defaults.dock.persistent-apps = [
    "/System/Applications/Calendar.app"
    "/System/Applications/Mail.app"
    "/Applications/Google Chrome.app"
    "${pkgs.ghostty-bin}/Applications/Ghostty.app"
    "/Applications/Zed.app"
    "/Applications/Telegram.app"
    "/Applications/Slack.app"
    "/Applications/Notion.app"
  ];
}
