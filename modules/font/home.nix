{ pkgs, ... }: {
  home.packages = [
    # Note: the overlay should be applied.
    pkgs.apple-sf-mono-font
  ];
}
