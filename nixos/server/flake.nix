{
  inputs = {
    nixpkgs.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-25.11&shallow=1";
  };
  outputs = {self, nixpkgs, ...}:{
    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      modules = [ 
        ../default/hardware.nix
        ../default/location.nix
        ../default/nix.nix
        ../default/network.nix
        ../default/users.nix
        ../default/wireguard.nix
        ../default/incus.nix
        ./hardware.nix
        ./network.nix
        ./hostname.nix
        ./wireguard.nix
        ./incus
      ];
    };
  };
}