{
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
