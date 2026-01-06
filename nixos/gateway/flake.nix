{
  inputs = {
    nixpkgs.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-25.11&shallow=1";
  };
  outputs = {self, nixpkgs, ...}:{
    nixosConfigurations.gateway = nixpkgs.lib.nixosSystem {
      modules = [
        ../default/hardware.nix
        ../default/location.nix
        ../default/nix.nix
        ../default/network.nix
        ../default/users.nix
        ../default/wireguard.nix
        ../default/podman.nix
        ./hardware.nix
        ./hostname.nix
        ./wireguard.nix
        ./podman
      ];
    };
  };
}