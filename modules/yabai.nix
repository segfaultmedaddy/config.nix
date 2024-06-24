{ pkgs, ... }: {
  services.yabai = {
    enable = true;
    package = pkgs.yabai;
  };
}
