{ user }:
{ pkgs, ... }:
{
  system.stateVersion = "25.05";

  users.users.${user} = {
    shell = pkgs.bash;
  };

  environment.shells = with pkgs; [
    bashInteractive
  ];

  # Enable wayland
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable input devices
  services.libinput.enable = true;

  # Enable display manager
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.defaultSession = "hyprland";

  networking.networkmanager.enable = true;
  services.getty.autologinUser = "${user}";
}
