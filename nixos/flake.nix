{
  inputs = {
    nixpkgs-stable.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-25.11&shallow=1";
    nixpkgs-unstable.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-unstable&shallow=1";
    wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager.url = "github:nix-community/home-manager";
  };
  outputs = {
    self,
    nixpkgs-stable,
    nixpkgs-unstable,
    wsl,
    home-manager,
  }:{
    nixosConfigurations = {
      server = nixpkgs-stable.lib.nixosSystem {
        modules = [
          ./common/server.nix
          ./hardware/server.nix
          ./network/server.nix
          ./users/server.nix
          ./wireguard/server.nix
          ./incus/server
        ];
      };
      gateway = nixpkgs-stable.lib.nixosSystem{
        modules = [
          ./common/gateway.nix
          ./hardware/gateway.nix
          ./network/gateway.nix
          ./users/gateway.nix
          ./wireguard/gateway.nix
          ./podman/gateway
        ];
      };
      laptop = nixpkgs-unstable.lib.nixosSystem {
        modules = [
          ./common/laptop.nix
          ( import ./hardware/laptop.nix {wsl = wsl.nixosModules.default;} )
          ( import ./users/laptop.nix {home-manager = home-manager.nixosModules.home-manager;} )
        ];
      };
    };
  };
}