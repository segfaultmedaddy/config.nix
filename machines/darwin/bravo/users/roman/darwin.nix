{ pkgs, ... }:
{
  users.users.roman = {
    shell = pkgs.zsh;
  };

  homebrew.casks = [ "postman" ];
}
