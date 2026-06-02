{
  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-26.05";
    latest.url = "github:nixos/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
  };
  outputs = {self, stable, latest, agenix, ...}:{
    nixosConfigurations = {
      server = stable.lib.nixosSystem {
        modules = [
          agenix.nixosModules.default
          ./server
        ];
      };
      gateway = stable.lib.nixosSystem {
        modules = [
          agenix.nixosModules.default
          ./gateway
        ];
      };
      laptop = latest.lib.nixosSystem {
        modules = [
          agenix.nixosModules.default
          ./laptop
        ];
      };
    };
  };
}
