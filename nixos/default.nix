{latest, stable, agenix}:
builtins.mapAttrs (
  name: _:
  (if name == "laptop" then latest else stable).lib.nixosSystem {
    modules = [
      agenix.nixosModules.default
      ./hosts/${name}
    ];
  }
) (builtins.readDir ./hosts)