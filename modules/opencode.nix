{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.opencode2;
  jsonFormat = pkgs.formats.json { };
  opencode2 = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.opencode2;
in
{
  options.programs.opencode2 = {
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.symlinkJoin {
        name = "opencode-${opencode2.version}";
        inherit (opencode2) version;
        paths = [ opencode2 ];
        # llm-agents installs V2 as opencode2; integrations look for opencode.
        postBuild = ''
          ln -s opencode2 "$out/bin/opencode"
        '';
      };
      description = "OpenCode V2 package, including the opencode executable.";
    };

    settings = lib.mkOption {
      type = jsonFormat.type;
      default = { };
      description = "OpenCode V2 server settings written to ~/.config/opencode/opencode.jsonc.";
    };

    cli.settings = lib.mkOption {
      type = jsonFormat.type;
      default = { };
      example = {
        theme.name = "rosepine";
      };
      description = "OpenCode V2 terminal settings written to ~/.config/opencode/cli.json.";
    };
  };

  config = lib.mkMerge [
    { home.packages = [ cfg.package ]; }

    (lib.mkIf (cfg.settings != { }) {
      home.file."./.config/opencode/opencode.jsonc".source = jsonFormat.generate "opencode.jsonc" (
        { "$schema" = "https://opencode.ai/config.json"; } // cfg.settings
      );
    })

    (lib.mkIf (cfg.cli.settings != { }) {
      home.file."./.config/opencode/cli.json".source = jsonFormat.generate "opencode-cli.json" (
        { "$schema" = "https://opencode.ai/v2/cli.json"; } // cfg.cli.settings
      );
    })
  ];
}
