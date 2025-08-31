{
  user,
  inputs,
  system,
  ...
}:
{
  home.stateVersion = "25.11";

  home.sessionVariables = {
    CONFIG_ROOT_DIR = "/home/${user}/dev/personal/config.nix";
  };

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    plugins = [
      inputs.hyprland-plugins.packages.${system}.hyprbars
    ];
  };
}
