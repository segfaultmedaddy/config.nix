{ config, ... }: {
  # Wezterm is installed via homebrew on macOS, so we need to
  # manage configs on our own.
  home.file."./.config/wezterm/" = {
    source = ./config;
    recursive = true;
  };
}
