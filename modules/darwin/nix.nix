{ ... }:
{
  # nix.enable = true;
  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 1;
      Hour = 0;
      Minute = 0;
    };
    options = "--delete-older-than 30d";
  };

  nix.settings.experimental-features = ''
    nix-command flakes
  '';

  # zsh is default shell on macOS, make sure that it is configured properly with
  # nix-darwin.
  programs.zsh = {
    enable = true;
    shellInit = ''
      # Nix
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
      # End Nix
    '';
  };
}
