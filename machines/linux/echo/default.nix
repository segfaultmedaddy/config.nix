{ user }:
{ pkgs, ... }:
{
  system.stateVersion = "25.05";

  users.users.${user} = {
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
  };

  environment.shells = with pkgs; [
    bashInteractive
    zsh
  ];

  # Enable wayland
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  programs.hyprland = {
    enable = true;
  };
  environment.systemPackages = [ pkgs.kitty ];

  # Enable sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable input devices
  services.libinput.enable = true;

  networking.networkmanager.enable = true;
  services.getty.autologinUser = "${user}";

  # Tailscale
  services.tailscale = {
    enable = true;
    package = pkgs.tailscale;
  };
}
