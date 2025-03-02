{ pkgs, ... }:
{
  users.users.roman = {
    shell = pkgs.zsh;
  };

  homebrew.casks = [
    "postman"
    "webstorm"
  ];

  homebrew.brews = [
    "colima"
    "lima"
    "qemu"
    "docker"
    "docker-compose"
  ];

  system.defaults.dock.persistent-apps = [
    "/System/Applications/Launchpad.app"
    "/System/Applications/Calendar.app"
    "/System/Applications/Mail.app"
    "/Applications/Google Chrome.app"
    "/Applications/WezTerm.app"
    "/Applications/WebStorm.app"
    "/Applications/Zed.app"
    "/Applications/Slack.app"
    "/Applications/Telegram.app"
  ];
}
