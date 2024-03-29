{ pkgs, ... }: {
  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      fira-code
      jetbrains-mono

      # Note: the overlay should be applied.
      apple-sf-mono-font
    ];
  };
}
