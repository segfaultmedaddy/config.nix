{
  user,
  ...
}:
{
  home.stateVersion = "25.11";

  wayland.windowManager.hyprland.enable = true;

  home.sessionVariables = {
    CONFIG_ROOT_DIR = "/home/${user}/dev/personal/config.nix";
  };
}
