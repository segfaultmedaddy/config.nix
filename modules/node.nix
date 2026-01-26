{
  lib,
  pkgs,
  isDarwin,
  ...
}:
let
  fnm =
    if isDarwin then
      {
        programs.zsh.initContent = ''
          eval "$(${pkgs.fnm}/bin/fnm env --use-on-cd)"
        '';
      }
    else
      { };
in
{
  home.packages = [
    # nodejs manager
    (lib.hiPrio pkgs.nodejs)
  ]
  ++ (if isDarwin then [ pkgs.fnm ] else [ ]);
}
// fnm
