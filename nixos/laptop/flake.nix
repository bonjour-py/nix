{
  description = "bonjour laptop (wsl)";
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirrors.cernet.edu.cn/nix-channels/store"
    ];
  };
  inputs = {
    nixpkgs.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-unstable&shallow=1";
    wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, wsl, ... }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      modules = [
        wsl.nixosModules.default
        {
          wsl.enable = true;
          wsl.defaultUser = "bonjour";
        }
        ./hardware.nix
        ./nix.nix
        ./location.nix
        ./network.nix
      ];
    };
  };
}