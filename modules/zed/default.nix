{ config, ... }: {
  # zed is installed via homebrew on macos, so we need to
  # manage configs on our own.
  home.file."./.config/zed/" = {
    source = ./config;
    recursive = true;
  };
}
