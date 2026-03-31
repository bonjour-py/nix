{
  description = "bonjour";
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
  };
  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-25.11";
    latest.url = "github:nixos/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "latest";
    };
    nixos = {
      url = "./nixos";
      inputs = {
        stable.follows = "stable";
        latest.follows = "latest";
        agenix.follows = "agenix";
      };
    };
    home = {
      url = "./home";
      inputs = {
        latest.follows = "latest";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = {self, nixos, home, ...}:{
    nixosConfigurations = nixos.nixosConfigurations;
    homeConfigurations = nixos.homeConfigurations;
  };
}