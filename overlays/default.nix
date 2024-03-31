final: prev: {
  apple-sf-mono-font = final.pkgs.callPackage ../packages/sf-mono-font.nix { };
  sst = final.pkgs.callPackage ../packages/sst.nix { };
  # dockutil = final.pkgs.callPackage ../packages/dockutil.nix {};
}
