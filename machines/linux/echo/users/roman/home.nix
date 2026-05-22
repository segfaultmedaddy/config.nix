{
  user,
  pkgs,
  ...
}:
{
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    docker-compose
  ];

  home.sessionVariables = {
    CONFIG_ROOT_DIR = "/home/${user}/dev/personal/config.nix";
  };

  programs.git = {
    settings.user.name = "Roman";
    settings.user.email = "roman@vanesyan.com";
  };

  programs.ssh = {
    settings."*" = {
      AddKeysToAgent = "yes";
    };
  };

  services.ssh-agent = {
    enable = true;
  };
}
