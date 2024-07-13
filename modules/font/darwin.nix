{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      fira-code
      jetbrains-mono
      ibm-plex

      # Note: the overlay should be applied.
      apple-sf-mono-font
    ];
  };
}
