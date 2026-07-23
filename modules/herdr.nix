{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.herdr;

  opencodePlugin =
    pkgs.runCommandLocal "herdr-opencode-plugin.js"
      {
        nativeBuildInputs = [ cfg.package ];
      }
      ''
        export HOME="$TMPDIR/home"
        mkdir -p "$HOME/.config/opencode"

        herdr integration install opencode >/dev/null

        install -Dm644 "$HOME/.config/opencode/plugins/herdr-agent-state.js" "$out"
      '';
in
{
  options.programs.herdr.opencode.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Install the Herdr OpenCode plugin into ~/.config/opencode/plugins/herdr-agent-state.js.";
  };

  config = lib.mkIf (cfg.enable && cfg.opencode.enable) {
    assertions = [
      {
        assertion = cfg.package != null;
        message = "programs.herdr.package must not be null when programs.herdr.opencode.enable is true.";
      }
    ];

    home.file."./.config/opencode/plugins/herdr-agent-state.js".source = opencodePlugin;
  };
}
