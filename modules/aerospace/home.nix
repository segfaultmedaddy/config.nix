{ ... }:
{
  # aerospace is installed via homebrew on macos, so we need to
  # manage configs on our own.
  home.file."./.config/aerospace/" = {
    source = ./config;
    recursive = true;
  };
}
