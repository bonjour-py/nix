{
  inputs = {
    stable.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-25.11&shallow=1";
    latest.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-unstable&shallow=1";
    wsl.url = "github:nix-community/NixOS-WSL";
    home-manager.url = "github:nix-community/home-manager";
    agenix.url = "github:ryantm/agenix";
  };
  outputs = {self, stable, latest, wsl, home-manager, agenix, ...}:{
    nixosConfigurations = {
      server = stable.lib.nixosSystem {
        modules = [
          agenix.nixosModules.default
          ./server
        ];
      };
      gateway = stable.lib.nixosSystem {
        modules = [
          agenix.nixosModules.default
          ./gateway
        ];
      };
      laptop = latest.lib.nixosSystem {
        modules = [
          wsl.nixosModules.default
          home-manager.nixosModules.home-manager
          agenix.nixosModules.default
          ./laptop
        ];
      };
    };
  };
}