{
  outputs = {self, latest, agenix, home-manager, ...}:{
    homeConfigurations.bonjour = home-manager.lib.homeManagerConfiguration {
      modules = [
      ];
    };
  };
}
