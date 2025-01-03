{ pkgs, ... }:
{
  users.users.roman = {
    shell = pkgs.zsh;
  };

  homebrew.casks = [
    "transmission"
    "android-studio"
    "obsidian"
    "linear-linear" # linear.app
    "notion"
  ];

  system.defaults.dock.persistent-apps = [
    "/System/Applications/Launchpad.app"
    "/System/Applications/Calendar.app"
    "/System/Applications/Mail.app"
    "/Applications/Safari.app"
    "/Applications/Obsidian.app"
    "/Applications/WezTerm.app"
    "/Applications/Zed.app"
    "/Applications/Telegram.app"
    "/Applications/Slack.app"
  ];
}
