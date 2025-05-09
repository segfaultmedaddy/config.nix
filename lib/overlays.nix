inputs:
let
  path = ../overlays;
  inherit (builtins)
    map
    filter
    attrNames
    readDir
    match
    pathExists
    ;
  overlayFiles = filter (
    n: match ".*\\.nix" n != null || pathExists (path + ("/" + n + "/default.nix"))
  ) (attrNames (readDir path));
in
map (n: import (path + ("/" + n)) inputs) overlayFiles
