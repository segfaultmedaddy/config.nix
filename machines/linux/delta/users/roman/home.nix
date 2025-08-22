{ hostUser, ... }:
{
  home.stateVersion = "25.11";

  home.sessionVariables = {
    # I run VM within lima VM on macOS. home directory is linked over to the VM
    # at the boot time.
    CONFIG_ROOT_DIR = "/Users/${hostUser}/dev/personal/config.nix";
  };
}
