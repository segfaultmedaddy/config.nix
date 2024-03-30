{ config, ... }: {
  homebrew = {
    brews = [
      # This is needed for the postgres client to work.
      # I choose it over nix package cause Rails has troubles with it.
      "postgresql"
    ];

    casks = [
      "beekeeper-studio"
    ];
  };
}
