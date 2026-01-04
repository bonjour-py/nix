{
  inputs = {
    nixpkgs.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-unstable&shallow=1";
    wsl.url = "github:nix-community/NixOS-WSL";
    home-manager.url = "github:nix-community/home-manager";
    agenix.url = "github:ryantm/agenix";
  };
  outputs = {self, nixpkgs, default, wsl, home-manager, agenix, ...}:{
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      modules = [
        wsl.nixosModules.default
        home-manager.nixosModules.home-manager
        agenix.nixosModules.default
        default.nixosModules.location
        default.nixosModules.nix
        ./hardware.nix
        ./hostname.nix
      ];
    };
  };
}