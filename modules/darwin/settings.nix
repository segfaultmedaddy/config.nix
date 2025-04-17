{ ... }:
{

  system.defaults.dock = {
    show-recents = false;
    orientation = "bottom";
    autohide = false;
    magnification = false;

    # hot corners
    wvous-tr-corner = 1; # disabled
    wvous-br-corner = 1; # disabled
    wvous-bl-corner = 1; # disabled
    wvous-tl-corner = 1; # disabled
  };

  # Increase key repeat rate. It helps with typing faster.
  system.defaults.NSGlobalDomain = {
    InitialKeyRepeat = 15;
    KeyRepeat = 2;
    ApplePressAndHoldEnabled = false;
  };

  system.defaults.NSGlobalDomain = {
    AppleShowAllExtensions = true; # show file extensions in Finder.
    AppleShowAllFiles = true; # show hidden files in Finder.
  };

  system.defaults.finder = {
    AppleShowAllExtensions = true; # show file extensions in Finder.
    AppleShowAllFiles = true; # show hidden files in Finder.
  };

  # prevent creation of .DS_Store files on network or USB volumes.
  system.defaults.CustomUserPreferences."com.apple.desktopservices" = {
    DSDontWriteNetworkStores = true;
    DSDontWriteUSBStores = true;
  };

  system.defaults.finder = {
    FXRemoveOldTrashItems = true; # remove items in the trash after 30 days
    ShowPathbar = true; # show path at the bottom of a Finder window.
    ShowStatusBar = true; # show status bar at the bottom of a Finder window.
  };

  system.defaults.controlcenter = {
    BatteryShowPercentage = true; # show battery percentage in menu bar.
  };

  # Disable long animation for tails switching.
  system.defaults.universalaccess.reduceMotion = true;
  system.defaults.universalaccess.reduceTransparency = true;

  # Enable sudo via TouchID or Apple Watch.
  security.pam.services.sudo_local.touchIdAuth = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
  };
}
