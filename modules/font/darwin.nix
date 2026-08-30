{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      fira-code
      jetbrains-mono
      ibm-plex
      nerd-fonts.symbols-only

      # overlay-based.
      apple-sf-mono-font
    ];
  };
}
