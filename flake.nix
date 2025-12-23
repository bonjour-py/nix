{
  description = "bonjour";
  inputs = {
    nixos.url = "./nixos";
  };

  outputs = {self, nixos}:{
    nixosConfigurations = nixos.nixosConfigurations;
  };
}