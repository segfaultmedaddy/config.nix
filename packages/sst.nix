{ lib, fetchFromGitHub, buildGoModule }: buildGoModule rec {
  pname = "sst-ion";
  version = "0.0.366";

  src = fetchFromGitHub {
    owner = "sst";
    repo = "ion";
    rev = "v${version}";
    hash = "sha256-/qekDozYfsEaxxj34aDOB0k6br84IDMAPlT4by5jghs=";
  };

  subPackages = [ "cmd/sst" ];
  vendorHash = "sha256-xzenwpgGYFo3+/dqj7T50rP3AsmrbnuA+q6fucovhgw=";

  meta = with lib; {
    license = licenses.mit;
  };
}
