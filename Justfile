name := "delta"

lima-bootstrap0:
  limactl start --name={{name}} --yes ./nixos.yaml
  limactl shell {{name}} -- nixos-rebuild boot --flake .#{{name}} --sudo
  sleep 5
  limactl restart {{name}}
