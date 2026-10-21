{latest, stable, agenix}:
latest.legacyPackages.x86_64-linux.lib.mapAttrs' (
  name: _:
  latest.legacyPackages.x86_64-linux.lib.nameValuePair
    (latest.legacyPackages.x86_64-linux.lib.removeSuffix ".nix" name)
    (
      import ./configurations/${name} {
        latest = latest.lib.nixosSystem;
        stable = stable.lib.nixosSystem;
        agenix = agenix.nixosModules.default;
      }
    )
) (builtins.readDir ./configurations)