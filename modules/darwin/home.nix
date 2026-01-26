{
  machine,
  system,
  user,
  pkgs,
  ...
}:
let
  homebrewPrefix = (if system == "aarch64-darwin" then "/opt/homebrew" else "/usr/local");
in
{
  imports = [
    ../home

    ../1password/darwin/home.nix
    ../aerospace/home.nix
    ../wezterm/home.nix

    # ../zed/home.nix
  ];

  home.homeDirectory = "/Users/${user}";

  programs.zsh = {
    initContent = ''
      eval "$(${homebrewPrefix}/bin/brew shellenv)"
    '';
    shellAliases = {
      nix-switch-system = "cd $CONFIG_ROOT_DIR && sudo darwin-rebuild switch --flake .#${machine}";
      nix-update-system = "cd $CONFIG_ROOT_DIR && nix flake update && cd -";
      cat = "bat";
      htop = "btop";
      top = "btop";
    };
  };

  home.packages = with pkgs; [
    pdfcpu # pdf manipulation
    (lib.hiPrio ffmpeg-full)
    clawdbot-app

    # Languages
    # sourcekit-lsp # swift lsp
  ];

  programs.awscli.enable = true;
}
