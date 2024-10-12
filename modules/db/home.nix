{ pkgs, ... }:
{
  home.packages = with pkgs; [
    atlas # atlas is a tool for db migrations
    sqlc # sqlc is a tool for generating type safe Go from SQL
  ];
}
