{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.opencode2;
  jsonFormat = pkgs.formats.json { };

in
{
  options.programs.opencode2 = {
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
