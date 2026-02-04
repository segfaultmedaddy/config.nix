# This file is not part of the Nix configuration of the system and is used by agenix
# to generate secrets.
let
  systems = {
    bravo = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO0GaBcLPoP/qZKjCX+Rr6vpT9MhBtboumXb/CWaQPDg";
    charlie = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAU+oIGIifk5usOR0LLhnXrKmR0k//vmlPExlHHi8iAC";
    echo = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOuck5AllNFDtEz8yiGh19igXfZ4w8dbkIxcZ8+iUdQ9";
  };
  allSystems = builtins.attrValues systems;
in
{
}
