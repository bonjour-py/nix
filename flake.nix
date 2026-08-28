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
    latest.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-26.05";
    nixos = {
      url = "./nixos";
      inputs = {
        latest.follows = "latest";
        stable.follows = "stable";
      };
    };
    profile = {
      url = "./profile";
      inputs = {
        latest.follows = "latest";
        stable.follows = "stable";
      };
    };
  };

  outputs = {self, nixos, profile, ...}:{
    nixosConfigurations = nixos.nixosConfigurations;
    packages = profile.packages;
  };
}