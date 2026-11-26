let
  flake = builtins.getFlake (toString ../..);
  runners = {
    aarch64-darwin = "macos-15";
    aarch64-linux = "ubuntu-24.04-arm";
    x86_64-linux = "ubuntu-24.04";
  };
  targets =
    output: derivation:
    builtins.attrValues (
      builtins.mapAttrs (name: config: {
        inherit name;
        runner = runners.${config.pkgs.stdenv.hostPlatform.system};
        target = "${output}.${builtins.toJSON name}.${derivation}";
      }) flake.${output}
    );
in
{
  include =
    if builtins.match ".*-darwin" builtins.currentSystem != null then
      targets "darwinConfigurations" "system"
    else
      targets "nixosConfigurations" "config.system.build.toplevel";
}
