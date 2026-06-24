{
  inputs = {
    latest.url = "github:nix-community/home-manager";
    flatpak.url = "github:gmodena/nix-flatpak/latest";
  };
  outputs = {self, latest, flatpak, ...}:{
    homeConfigurations.bonjour = latest.lib.homeManagerConfiguration {
      modules = [
        flatpak.homeManagerModules.nix-flatpak
        ./flatpak.nix
      ];
    };
  };
}
