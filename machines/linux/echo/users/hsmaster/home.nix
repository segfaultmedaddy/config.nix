{
  user,
  inputs,
  system,
  ...
}:
{
  modules = [
    {
      wayland.windowManager.hyprland = {
        enable = true;
        # set the flake package
        package = inputs.hyprland.packages.${system}.hyprland;
        portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
      };
    }
  ];

  home.stateVersion = "25.11";

  home.sessionVariables = {
    CONFIG_ROOT_DIR = "/home/${user}/dev/personal/config.nix";
  };
}
