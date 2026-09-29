{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.programs.rtk;
  tomlFormat = pkgs.formats.toml { };
  configPath =
    if pkgs.stdenv.hostPlatform.isDarwin then
      "./Library/Application Support/rtk/config.toml"
    else
      "./.config/rtk/config.toml";

  # `rtk init --opencode` only ships a V1 plugin, so the V2 port is maintained here.
  opencodePlugin = pkgs.replaceVars ./rtk/opencode-plugin.ts {
    rtk = lib.getExe' cfg.package "rtk";
  };
in
{
  options.programs.rtk = {
    enable = lib.mkEnableOption "RTK command rewriting";

    package = lib.mkOption {
      type = lib.types.package;
      default = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.rtk;
      description = "RTK package to install.";
    };

    settings = lib.mkOption {
      type = tomlFormat.type;
      default = { };
      example = {
        hooks.exclude_commands = [
          "curl"
          "playwright"
        ];
        tee = {
          enabled = true;
          mode = "failures";
        };
      };
      description = "Settings written to ~/.config/rtk/config.toml.";
    };

    opencode.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Install the RTK OpenCode (V2) plugin into ~/.config/opencode/plugins/rtk.ts.";
    };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        home.packages = [ cfg.package ];

        home.file.${configPath}.source = tomlFormat.generate "rtk-config.toml" cfg.settings;
      }

      (lib.mkIf cfg.opencode.enable {
        home.file."./.config/opencode/plugins/rtk.ts".source = opencodePlugin;
      })
    ]
  );
}
