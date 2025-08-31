{
  user,
  ...
}:
{
  home.stateVersion = "25.11";

  home.sessionVariables = {
    CONFIG_ROOT_DIR = "/home/${user}/dev/personal/config.nix";
  };

  # Autostart hyprland
  programs.bash.profileExtra = ''
    exec Hyprland
  '';

  programs.kitty.enable = true;
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    plugins = [
      # inputs.hyprland-plugins.packages.${system}.hyprbars
    ];
  };
}
