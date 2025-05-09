inputs: final: prev: {
  apple-sf-mono-font = final.pkgs.callPackage ../packages/sf-mono-font.nix { };
  cryo = final.pkgs.callPackage ../packages/cryo.nix { inherit (inputs) naersk; };
}
