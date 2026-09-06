# config.nix

Personal Nix flake for macOS (`nix-darwin`) and Linux (`nixos` + `home-manager`) machines.

## Start here

- `flake.nix`: machine registry and top-level outputs.
- `machines/darwin/mkSystem.nix` and `machines/linux/mkSystem.nix`: how a host is assembled.
- `modules/darwin/default.nix` and `modules/linux/default.nix`: shared OS defaults.
- `modules/home/default.nix`: shared `home-manager` config.
- `machines/<platform>/<machine>/`: host-specific config.

## Layout

- `machines/darwin/<machine>/default.nix`: machine-level macOS settings.
- `machines/darwin/<machine>/users/<user>/darwin.nix`: user-specific `nix-darwin` settings.
- `machines/darwin/<machine>/users/<user>/home.nix`: user-specific `home-manager` settings.
- `machines/linux/<machine>/default.nix`: machine-level NixOS settings.
- `machines/linux/<machine>/users/<user>/home.nix`: user-specific `home-manager` settings.
- `modules/`: reusable shared modules.
- `packages/`: custom packages and overlays.
- `secrets/`: agenix-backed secret definitions.

## Apply

macOS:

```sh
nix run nix-darwin -- switch --flake .#<darwinConfiguration>
```

Linux:

```sh
sudo nixos-rebuild switch --flake .#<nixosConfiguration> --impure
```

`--impure` is required for NixOS hosts here because the shared Linux module imports `/etc/nixos/hardware-configuration.nix`, the default hardware config generated on the target machine.

## Ghostty on remote machines

Run this once for each remote machine to install Ghostty's terminfo entry:

```sh
infocmp -x xterm-ghostty | ssh <machine-ip> -- tic -x -
```

## Spin up a new machine

1. Set up Nix on the target machine: install [Determinate Nix](https://docs.determinate.systems/determinate-nix/) on macOS, or install NixOS, which includes Nix.
2. Pick the platform: `machines/darwin` or `machines/linux`.
3. Copy a nearby machine as a template.
4. Add the minimum host files:
   `default.nix`, plus `users/<user>/home.nix`, and on Darwin also `users/<user>/darwin.nix`.
5. Register the machine in `flake.nix` under `darwinConfigurations` or `nixosConfigurations`.
6. Apply it with the matching flake output name.

## Notes

- Shared changes usually belong in `modules/`; machine-only changes belong under `machines/`.
- On macOS, give your terminal Full Disk Access before the first switch.
