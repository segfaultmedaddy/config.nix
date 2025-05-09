{
  pkgs,
  naersk,
  ...
}:
let
  naersk-lib = pkgs.callPackage naersk { };
in
naersk-lib.buildPackage rec {
  pname = "cryo_cli";
  version = "0.3.2";
  src = pkgs.fetchFromGitHub {
    owner = "paradigmxyz";
    repo = "cryo";
    rev = version;
    sha256 = "sha256-p3YD3AUK0xPjj7HKZDouxHS8MVTOwYDRtea99TlqU5M=";
  };

  cargoBuildOptions =
    x:
    x
    ++ [
      "--package"
      "cryo_cli"
    ];

  # Optional: skip building tests or docs if you don't need them
  doCheck = false;
}
