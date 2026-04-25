inputs: final: prev: {
  apple-sf-mono-font = final.pkgs.callPackage ../packages/sf-mono-font.nix { };
  direnv = prev.direnv.overrideAttrs (old: {
    # Temporary local workaround for Darwin build/test issues.
    # Upstream: https://github.com/NixOS/nixpkgs/pull/513081
    # Tracking: https://github.com/NixOS/nixpkgs/issues/507531
    doCheck = if prev.stdenv.hostPlatform.isDarwin then false else old.doCheck or true;
  });
  opencode-patched = final.pkgs.callPackage ../packages/opencode.nix { inherit inputs; };
  xcode-build-server = final.pkgs.callPackage ../packages/xcode-build-server.nix { };
}
