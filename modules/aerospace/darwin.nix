{ ... }:
{
  homebrew.casks = [
    "nikitabobko/tap/aerospace"
  ];

  # https://nikitabobko.github.io/AeroSpace/guide#a-note-on-mission-control
  system.defaults.dock.expose-group-apps = true;

  # https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces
  # However, this no longer causing any issues, but allows to have separate
  system.defaults.spaces.spans-displays = false;
}
