{ pkgs, ... }:
let
  virt = import ../../../../../modules/virt/darwin.nix {
    useColima = false;
  };
in
{
  users.users.roman = {
    shell = pkgs.zsh;
  };

  imports = [
    virt
  ];
}
