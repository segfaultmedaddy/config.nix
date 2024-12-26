{ ... }:
{
  system.defaults.dock = {
    show-recents = false;
    orientation = "bottom";
    autohide = true;
    magnification = false;
  };

  system.defaults.CustomSystemPreferences = {
    # Increase key repeat rate. It helps with typing faster in neovim.
    "NSGlobalDomain" = {
      "InitialKeyRepeat" = 15;
      "KeyRepeat" = 2;
    };
  };

  # Disable long animation for tails switching.
  system.defaults.universalaccess.reduceMotion = true;
  system.defaults.universalaccess.reduceTransparency = true;

  # Enable sudo via TouchID or Apple Watch.
  security.pam.enableSudoTouchIdAuth = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
  };
}
