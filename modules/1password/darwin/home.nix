{ user, ... }:
{
  programs.ssh = {
    # I use 1password for storing my SSH key. 1password is installed via
    # homebrew.
    extraConfig = ''
      Host *
        IdentityAgent "/Users/${user}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
  };
}
