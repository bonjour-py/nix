{
  inputs = {
    nixpkgs.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-25.11&shallow=1";
  };
  outputs = {self, nixpkgs, default, ...}:{
    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      modules = [ 
        default.nixosModules.hardware
        default.nixosModules.location
        default.nixosModules.nix
        default.nixosModules.network
        default.nixosModules.users
        default.nixosModules.wireguard
        default.nixosModules.incus
        ./hardware.nix
        ./network.nix
        ./hostname.nix
        ./wireguard.nix
        ./incus
      ];
    };
  };
}