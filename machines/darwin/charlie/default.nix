{ ... }:
{
  system.stateVersion = 1;

  imports = [
    (import ../../../modules/dnsmasq.nix {
      bind = [
        "127.0.0.1"
        "::1"
      ];
      port = 53;
      addresses = {
        "internal" = "127.0.0.1";
        "localdev.exfac.xyz" = "127.0.0.1";
      };
    })
  ];

  homebrew.casks = [
    "docker"
    "languagetool"
  ];
}
