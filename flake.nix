{
  description = "bonjour";
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };
  inputs = {
    nixos.url = "./nixos";
    home.url = "./home";
  };

  outputs = {self, nixos, home, ...}:{
    nixosConfigurations = nixos.nixosConfigurations;
    homeConfigurations = nixos.homeConfigurations;
  };
}