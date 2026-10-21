inputs: final: prev: {
  apple-sf-mono-font = final.pkgs.callPackage ../packages/sf-mono-font.nix { };
  devenv =
    if prev.stdenv.hostPlatform.isDarwin then
      let
        source = prev.applyPatches {
          name = "devenv-darwin-openssl-source";
          src = inputs.devenv;
          # Prevent openssl-sys from probing Homebrew in non-static Darwin builds too.
          postPatch = ''
            substituteInPlace nix/crate-config.nix \
              --replace-fail '// lib.optionalAttrs (stdenv.hostPlatform.isStatic && stdenv.hostPlatform.isDarwin) {' \
                '// lib.optionalAttrs stdenv.hostPlatform.isDarwin {' \
              --replace-fail 'OPENSSL_STATIC = "1";' \
                'OPENSSL_STATIC = if stdenv.hostPlatform.isStatic then "1" else "0";'
          '';
        };
        outputs = (import "${source}/flake.nix").outputs (
          inputs.devenv.inputs // { self = inputs.devenv; }
        );
      in
      outputs.packages.${prev.stdenv.hostPlatform.system}.devenv
    else
      prev.devenv;
  lane = final.pkgs.callPackage ../packages/lane.nix { };
  xcode-build-server = final.pkgs.callPackage ../packages/xcode-build-server.nix { };
}
