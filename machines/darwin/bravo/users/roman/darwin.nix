{ pkgs, ... }:
{
  users.users.roman = {
    shell = pkgs.zsh;
  };

  homebrew.casks = [
    "docker-desktop"
    "postman"
    "cursor"
  ];

  homebrew.brews = [
    "colima"
    "lima"
    "qemu"
    "docker-compose"
  ];

  system.defaults.dock.persistent-apps = [
    "/System/Applications/Calendar.app"
    "/System/Applications/Mail.app"
    "/Applications/Google Chrome.app"
    "${pkgs.ghostty-bin}/Applications/Ghostty.app"
    "/Applications/WebStorm.app"
    "/Applications/Zed.app"
    "/Applications/Slack.app"
    "/Applications/Telegram.app"
  ];
}
