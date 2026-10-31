{ inputs, ... }:
{
  imports = [ inputs.vicinae.homeManagerModules.default ];

  programs.vicinae = {
    enable = true;
    launchd = {
      enable = true;
      autoStart = true;
    };
    settings.theme = {
      dark.name = "rose-pine";
      light.name = "rose-pine";
    };
  };
  home.file."./.config/vicinae/themes/rose-pine.toml".source =
    "${inputs.vicinae}/extra/themes/rose-pine.toml";
}
