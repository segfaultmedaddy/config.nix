{
  machine,
  pkgs,
  inputs,
  ...
}:
let
  palette = import ../theme/palette.nix;
in
{
  imports = [
    ../home
    ../herdr.nix
  ];

  programs.herdr = {
    enable = true;
    package = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.herdr;
    opencode.enable = true;

    settings.theme = {
      name = "catppuccin";
      custom = {
        accent = palette.neutral_11;
        panel_bg = palette.neutral_1;
        sidebar_bg = palette.neutral_0;
        active_row_bg = palette.neutral_2;
        selection_bg = palette.neutral_3;
        surface0 = palette.neutral_2;
        surface1 = palette.neutral_3;
        surface_dim = palette.neutral_1;
        overlay0 = palette.neutral_7;
        overlay1 = palette.neutral_9;
        text = palette.neutral_11;
        subtext0 = palette.neutral_9;
        mauve = palette.neutral_10;
        green = palette.green;
        yellow = palette.yellow;
        red = palette.red_3;
        blue = palette.cyan;
        teal = palette.teal_1;
        peach = palette.orange;
      };
    };
  };

  programs.zsh = {
    shellAliases = {
      nix-switch-system = "cd $CONFIG_ROOT_DIR && sudo nixos-rebuild switch --flake .#${machine} --impure";
      nix-boot-system = "cd $CONFIG_ROOT_DIR && sudo nixos-rebuild boot --flake .#${machine} --impure";
      nix-update-system = "cd $CONFIG_ROOT_DIR && nix flake update && cd -";
    };
  };
}
