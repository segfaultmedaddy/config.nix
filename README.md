# config.nix
Nix config for my macOS devices

```
nix run nix-darwin -- switch --flake .#macbook-pro-i7
```

### Installation process
Before applying the configuration make sure to give a full access to disk
to the terminal used to run the command.

For this go to the `System Preferences -> Security & Privacy -> Full Disk Access`
and enable the terminal.
