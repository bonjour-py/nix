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
    agenix.url = "github:ryantm/agenix";
  };

  outputs = {self, latest, stable, agenix, ...}:{
    nixosConfigurations = import ./nixos {
      latest = latest.lib.nixosSystem;
      stable = stable.lib.nixosSystem;
      agenix = agenix.nixosModules.default;
    };
    packages.x86_64-linux.default = latest.legacyPackages.x86_64-linux.callPackage ./profile {fallbacks = stable.legacyPackages.x86_64-linux;};
  };
}