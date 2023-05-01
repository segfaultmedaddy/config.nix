name: { darwin, nixpkgs, home-manager, system, user, overlays }:
darwin.lib.darwinSystem {
  inherit system;

  modules = [
    { nixpkgs.overlays = overlays; }
    ../machines/${name}.nix
    ../users/${user}/darwin.nix
    home-manager.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
    }
  ];
}

