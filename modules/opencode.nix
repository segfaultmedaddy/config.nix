{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.programs.opencode2;
  jsonFormat = pkgs.formats.json { };

  # catppuccin/opencode nests themes by flavor (themes/<flavor>/*.json), while
  # OpenCode only reads JSON files directly under ~/.config/opencode/themes.
  catppuccinThemes = pkgs.runCommandLocal "catppuccin-opencode-themes" { } ''
    mkdir -p "$out"
    cp ${inputs.catppuccin-opencode}/themes/*/*.json "$out/"
  '';
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
        theme.name = "catppuccin-mocha-mauve";
      };
      description = "OpenCode V2 terminal settings written to ~/.config/opencode/cli.json.";
    };

    catppuccin.enable = lib.mkEnableOption "Catppuccin themes for OpenCode (all flavors and accents)";
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

    (lib.mkIf cfg.catppuccin.enable {
      home.file."./.config/opencode/themes".source = catppuccinThemes;
    })
  ];
}
