{ inputs, ... }:
{
  imports = [ inputs.vicinae.homeManagerModules.default ];

  programs.vicinae = {
    enable = true;
    launchd = {
      enable = true;
      autoStart = true;
    };
  };
}
