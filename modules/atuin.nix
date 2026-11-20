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
        nativeBuildInputs = [
          cfg.package
          config.programs.opencode2.package
        ];
      }
      ''
        export HOME="$TMPDIR/home"
        export XDG_CONFIG_HOME="$HOME/.config"
        mkdir -p "$XDG_CONFIG_HOME"

        # Atuin selects its hook by running `opencode --version` on PATH.
        atuin hook install opencode

        plugin="$XDG_CONFIG_HOME/opencode/plugins/atuin.ts"
        grep -q '^export default ' "$plugin" || {
          echo 'Atuin did not generate an OpenCode V2 plugin' >&2
          exit 1
        }
        install -Dm644 "$plugin" "$out"
      '';
in
{
  options.programs.atuin.opencode.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Install Atuin's upstream OpenCode V2 hook for recording agent shell history.";
  };

  config = lib.mkIf (cfg.enable && cfg.opencode.enable) {
    xdg.configFile."opencode/plugins/atuin.ts".source = opencodePlugin;
  };
}
