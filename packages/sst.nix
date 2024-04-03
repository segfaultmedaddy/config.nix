{ pkgs, lib, fetchFromGitHub, buildGoModule }: buildGoModule rec {
  pname = "sst-ion";
  version = "0.0.255";

  src = fetchFromGitHub {
    owner = "sst";
    repo = "ion";
    rev = "v${version}";
    hash = "sha256-cvuRy4QCY34jG2sOYc6Ur81QUyACxJbKnYhmIOzfl64=";
  };

  subPackages = [ "cmd/sst" ];
  vendorHash = "sha256-F/6VawWgBjpNcjRT2rbf/01Dc5Xzd6KrUD3kFPVUVCQ=";

  meta = with lib; {
    license = licenses.mit;
  };
}
