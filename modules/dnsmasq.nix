{
  bind,
  port,
  addresses,
}:
{
  pkgs,
  lib,
  ...
}:
let
  mapEntries = f: attrs: builtins.attrValues (builtins.mapAttrs f attrs);
in
{
  environment.systemPackages = [ pkgs.dnsmasq ];

  launchd.daemons.dnsmasq = {
    serviceConfig.ProgramArguments = [
      "${pkgs.dnsmasq}/bin/dnsmasq"
      "--listen-address=${lib.strings.concatStringsSep "," bind}"
      "--port=${toString port}"
      "--keep-in-foreground"
    ] ++ (mapEntries (domain: addr: "--address=/${domain}/${addr}") addresses);

    serviceConfig.KeepAlive = true;
    serviceConfig.RunAtLoad = true;
  };

  environment.etc = builtins.listToAttrs (
    builtins.map (domain: {
      name = "resolver/${domain}";
      value = {
        enable = true;
        text = ''
          port ${toString port}
          nameserver ${builtins.elemAt bind 0}
        '';
      };
    }) (builtins.attrNames addresses)
  );
}
