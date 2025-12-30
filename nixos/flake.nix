{
  inputs = {
    nixpkgs-stable.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-25.11&shallow=1";
    nixpkgs-unstable.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-unstable&shallow=1";
    wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };
  outputs = {
    self,
    nixpkgs-stable,
    nixpkgs-unstable,
    wsl,
    home-manager,
  }:{
    nixosConfigurations = builtins.mapAttrs 
      (
        host: nixpkgs: nixpkgs.lib.nixosSystem {
          specialArgs = {
            wsl = wsl.nixosModules.default;
            home-manager = home-manager.nixosModules.home-manager;
            inherit host;
          };
          modules = [ ./default.nix ];
        }
      )
      {
        server = nixpkgs-stable;
        gateway = nixpkgs-stable;
        laptop = nixpkgs-unstable;
      };
  };
}