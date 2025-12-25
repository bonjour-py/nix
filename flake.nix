{
  description = "bonjour";
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirrors.cernet.edu.cn/nix-channels/store"
    ];
  };
  inputs = {
    nixos.url = "./nixos";
  };

  outputs = {self, nixos}:{
    nixosConfigurations = nixos.nixosConfigurations;
  };
}