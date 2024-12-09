{ ... }:
{
  homebrew.casks = [
    "nikitabobko/tap/aerospace"
  ];

  # https://nikitabobko.github.io/AeroSpace/guide#a-note-on-mission-control
  system.defaults.dock.expose-group-apps = true;

  # https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces
  system.defaults.spaces.spans-displays = true;
}
