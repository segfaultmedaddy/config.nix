{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.atuin;

  opencodePlugin =
    pkgs.runCommandLocal "atuin-opencode-plugin.ts"
      {
        nativeBuildInputs = [ cfg.package ];
      }
      ''
        export HOME="$TMPDIR/home"
        export XDG_CONFIG_HOME="$HOME/.config"
        mkdir -p "$XDG_CONFIG_HOME"

        atuin hook install opencode >/dev/null

        install -Dm644 "$XDG_CONFIG_HOME/opencode/plugins/atuin.ts" "$out"
      '';
in
{
  options.programs.atuin.opencode.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Install the Atuin OpenCode plugin into ~/.config/opencode/plugins/atuin.ts.";
  };

  config = lib.mkIf (cfg.enable && cfg.opencode.enable) {
    home.file."./.config/opencode/plugins/atuin.ts".source = opencodePlugin;
  };
}
