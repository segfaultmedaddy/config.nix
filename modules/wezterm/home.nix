{ ... }:
{
  # wezterm is installed via homebrew on macos, so we need to
  # manage configs on our own.
  home.file."./.config/wezterm/" = {
    source = ./config;
    recursive = true;
  };
}
