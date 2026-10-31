{ inputs, ... }:
let
  # Rosé Pine's main (dark) palette, shared by tools without an upstream port.
  colors = {
    base = "#191724";
    surface = "#1f1d2e";
    overlay = "#26233a";
    muted = "#6e6a86";
    subtle = "#908caa";
    text = "#e0def4";
    love = "#eb6f92";
    gold = "#f6c177";
    rose = "#ebbcba";
    pine = "#31748f";
    foam = "#9ccfd8";
    iris = "#c4a7e7";
  };
in
{
  programs.atuin.settings.theme.name = "rose-pine";
  home.file.".config/atuin/themes/rose-pine.toml".source =
    "${inputs.rose-pine-atuin}/dist/rose-pine.toml";

  programs.bat = {
    config.theme = "rose-pine";
    themes.rose-pine = {
      src = inputs.rose-pine-tm-theme;
      file = "dist/rose-pine.tmTheme";
    };
  };

  programs.btop.settings.color_theme = "rose-pine";
  home.file.".config/btop/themes/rose-pine.theme".source = "${inputs.rose-pine-btop}/rose-pine.theme";

  programs.delta.options = {
    features = "rose-pine";
    syntax-theme = "rose-pine";
  };
  programs.git.includes = [ { path = "${inputs.rose-pine-delta}/dist/rose-pine.gitconfig"; } ];

  # The colors follow the official rose-pine/lazygit theme.
  programs.lazygit.settings.gui.theme = {
    activeBorderColor = [
      colors.pine
      "bold"
    ];
    inactiveBorderColor = [ colors.muted ];
    searchingActiveBorderColor = [
      colors.rose
      "bold"
    ];
    optionsTextColor = [ colors.foam ];
    selectedLineBgColor = [ colors.pine ];
    inactiveViewSelectedLineBgColor = [
      colors.overlay
      "bold"
    ];
    cherryPickedCommitFgColor = [ colors.surface ];
    cherryPickedCommitBgColor = [ colors.rose ];
    markedBaseCommitFgColor = [ colors.foam ];
    markedBaseCommitBgColor = [ colors.gold ];
    unstagedChangesColor = [ colors.love ];
    defaultFgColor = [ colors.text ];
  };

  programs.starship.settings = {
    palette = "rose_pine";
    palettes.rose_pine = colors;
  };

  programs.zsh.syntaxHighlighting.styles = {
    command = "fg=${colors.foam}";
    builtin = "fg=${colors.foam}";
    alias = "fg=${colors.foam}";
    function = "fg=${colors.foam}";
    unknown-token = "fg=${colors.love}";
    reserved-word = "fg=${colors.iris}";
    single-quoted-argument = "fg=${colors.gold}";
    double-quoted-argument = "fg=${colors.gold}";
    comment = "fg=${colors.muted}";
    path = "fg=${colors.text},underline";
  };
}
