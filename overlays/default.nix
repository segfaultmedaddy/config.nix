inputs: final: prev: {
  apple-sf-mono-font = final.pkgs.callPackage ../packages/sf-mono-font.nix { };
  kubernetes-helm = prev.kubernetes-helm.overrideAttrs (old: {
    # Temporary local workaround for nixpkgs trying to patch a removed Helm test.
    doCheck = false;
  });
  xcode-build-server = final.pkgs.callPackage ../packages/xcode-build-server.nix { };
}
