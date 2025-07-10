{
  pkgs,
  lib,
  python311,
  ...
}:
pkgs.stdenv.mkDerivation rec {
  pname = "xcode-build-server";
  version = "1.2.0";

  src = pkgs.fetchFromGitHub {
    owner = "SolaWing";
    repo = "xcode-build-server";
    rev = "refs/tags/v${version}";
    hash = "sha256-jjTdfWKg2faNeMVn7Fl15vlsfmluDugE56YqkHMotik=";
  };

  nativeBuildInputs = [ pkgs.makeWrapper ];

  buildInputs = [ python311 ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    mkdir -p $out/share/xcode-build-server
    cp -r . $out/share/xcode-build-server/
    chmod +x $out/share/xcode-build-server/xcode-build-server
    makeWrapper $out/share/xcode-build-server/xcode-build-server $out/bin/xcode-build-server \
      --set PYTHONPATH $out/share/xcode-build-server \
      --prefix PATH : ${lib.makeBinPath [ python311 ]}

    runHook postInstall
  '';

  meta = with lib; {
    description = "A build server protocol implementation for integrate xcode with sourcekit-lsp";
    homepage = "https://github.com/SolaWing/xcode-build-server";
    license = licenses.mit;
    platforms = platforms.darwin;
  };
}
