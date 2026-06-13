inputs: final: prev: {
  apple-sf-mono-font = final.pkgs.callPackage ../packages/sf-mono-font.nix { };
  bun = prev.callPackage ../packages/bun.nix {
    bun = prev.bun;
    fetchurl = prev.fetchurl;
  };
  kubernetes-helm = prev.kubernetes-helm.overrideAttrs (old: {
    # Temporary local workaround for nixpkgs trying to patch a removed Helm test.
    doCheck = false;
  });
  opencode-patched = final.pkgs.callPackage ../packages/opencode.nix { inherit inputs; };
  xcode-build-server = final.pkgs.callPackage ../packages/xcode-build-server.nix { };
}
