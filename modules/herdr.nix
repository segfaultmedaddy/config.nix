{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.herdr;

  # herdr ships OpenCode V2 support as a CLI (TUI) plugin: cli.json loads the
  # ./herdr-opencode directory, whose tui.js re-exports ../herdr-tui-session.js.
  # The server plugin (plugins/herdr-agent-state.js) is a no-op under V2 and the
  # tui.jsonc entry is V1-only, so neither is installed.
  #
  # All files are linked out of this single store path so the relative
  # `../herdr-tui-session.js` import resolves after symlink resolution.
  opencodeIntegration =
    pkgs.runCommandLocal "herdr-opencode-integration"
      {
        nativeBuildInputs = [ cfg.package ];
      }
      ''
        export HOME="$TMPDIR/home"
        mkdir -p "$HOME/.config/opencode"

        herdr integration install opencode >/dev/null

        src="$HOME/.config/opencode"
        install -Dm644 "$src/cli.json" "$out/cli.json"
        install -Dm644 "$src/herdr-tui-session.js" "$out/herdr-tui-session.js"
        install -Dm644 "$src/herdr-opencode/tui.js" "$out/herdr-opencode/tui.js"
      '';
in
{
  options.programs.herdr.opencode.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Install the Herdr OpenCode V2 CLI plugin (~/.config/opencode/cli.json and herdr-opencode/).";
  };

  config = lib.mkIf (cfg.enable && cfg.opencode.enable) {
    assertions = [
      {
        assertion = cfg.package != null;
        message = "programs.herdr.package must not be null when programs.herdr.opencode.enable is true.";
      }
    ];

    home.file = {
      "./.config/opencode/cli.json".source = "${opencodeIntegration}/cli.json";
      "./.config/opencode/herdr-tui-session.js".source = "${opencodeIntegration}/herdr-tui-session.js";
      "./.config/opencode/herdr-opencode".source = "${opencodeIntegration}/herdr-opencode";
    };
  };
}
