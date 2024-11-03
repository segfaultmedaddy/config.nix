{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      fira-code
      jetbrains-mono
      ibm-plex

      # overlay-based.
      apple-sf-mono-font
    ];
  };
}
