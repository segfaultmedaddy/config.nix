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
    "/Applications/WezTerm.app"
    "/Applications/Zed.app"
    "/Applications/Telegram.app"
    "/Applications/Slack.app"
    "/Applications/Notion.app"
  ];
}
