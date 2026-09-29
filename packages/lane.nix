{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "lane";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "lukeed";
    repo = "lane";
    rev = "v${version}";
    hash = "sha256-lQTYZ2vZZ7FWaL3aX5o/fB6WzFlEkorzkpQSJjfn85Y=";
  };

  cargoHash = "sha256-LwyxqMMG6a6xgXawDFQz0v7FbdomNssiBasbndTS69o=";

  cargoBuildFlags = [
    "--package"
    "lane"
  ];

  # Tests drive real Git repositories and reflink-capable filesystems.
  doCheck = false;

  meta = {
    description = "Copy-on-write Git worktrees with memory that survives them";
    homepage = "https://github.com/lukeed/lane";
    license = lib.licenses.mit;
    mainProgram = "lane";
  };
}
