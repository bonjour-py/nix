{latest, stable, agenix}:
latest.lib.mapAttrs' (
  name: _:
  latest.lib.nameValuePair
    (latest.lib.removeSuffix ".nix" name)
    (
      import ./configurations/${name} {
        latest = latest.lib.nixosSystem;
        stable = stable.lib.nixosSystem;
        agenix = agenix.nixosModules.default;
      }
    )
) (builtins.readDir ./configurations)