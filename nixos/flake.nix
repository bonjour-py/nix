{
  inputs = {
    nixpkgs-stable.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-25.11&shallow=1";
    nixpkgs-unstable.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-unstable&shallow=1";
    agenix.url = "github:ryantm/agenix";
    wsl.url = "github:nix-community/NixOS-WSL";
    home-manager.url = "github:nix-community/home-manager";
  };
  outputs = {
    self,
    nixpkgs-stable,
    nixpkgs-unstable,
    agenix,
    wsl,
    home-manager,
  }:{
    nixosConfigurations = {
      server = nixpkgs-stable.lib.nixosSystem {modules = [./server];};
      gateway = nixpkgs-stable.lib.nixosSystem {modules = [./gateway];};
      laptop = nixpkgs-unstable.lib.nixosSystem {
        modules = [./laptop];
        specialArgs = {
          wsl = wsl.nixosModules.default;
          home-manager = home-manager.nixosModules.home-manager;
          agenix = agenix.nixosModules.default;
        };
      };
    };
  };
}