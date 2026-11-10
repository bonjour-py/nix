{
  description = "bonjour";
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };
  inputs = {
    latest.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-26.05";
    hardware.url = "github:nixos/nixos-hardware";
    agenix.url = "github:ryantm/agenix";
  };

  outputs = {self, latest, stable, hardware, agenix, ...}:{
    nixosConfigurations = import ./nixos {
      inherit latest stable hardware agenix;
    };
    packages.x86_64-linux = import ./packages {
      inherit latest stable;
    };
  };
}