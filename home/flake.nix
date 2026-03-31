{
  inputs = {
    latest.url = "github:nix-community/home-manager";
  };
  outputs = {self, latest, ...}:{
    homeConfigurations.bonjour = latest.lib.homeManagerConfiguration {
      modules = [
      ];
    };
  };
}
