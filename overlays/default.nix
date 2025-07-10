inputs: final: prev: {
  apple-sf-mono-font = final.pkgs.callPackage ../packages/sf-mono-font.nix { };
  cryo = final.pkgs.callPackage ../packages/cryo.nix { inherit (inputs) naersk; };
  xcode-build-server = final.pkgs.callPackage ../packages/xcode-build-server.nix { };
}
