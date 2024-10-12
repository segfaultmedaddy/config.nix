{
  pkgs,
  lib,
  fetchurl,
  stdenv,
  ...
}:
stdenv.mkDerivation {
  pname = "apple-font-sf-mono";
  version = "0.1.1";

  src = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
    sha256 = "sha256-bUoLeOOqzQb5E/ZCzq0cfbSvNO1IhW1xcaLgtV2aeUU=";
  };

  dontBuild = true;
  sourceRoot = "./Library/Fonts";

  nativeBuildInputs = [
    pkgs.libarchive
    pkgs.p7zip
  ];

  unpackPhase = ''
    7z x $src
    find . -name "*.pkg" -print -exec 7z x {} \;
    find . -name "Payload~" -print -exec 7z x {} \;
  '';

  installPhase = ''
    runHook preInstall
    find . -name '*.ttf' -exec install -m444 -Dt $out/share/fonts/truetype {} \;
    find . -name '*.otf' -exec install -m444 -Dt $out/share/fonts/opentype {} \;
    runHook postInstall
  '';

  meta = with lib; {
    license = licenses.unlicense;
    platforms = platforms.darwin;
  };
}
