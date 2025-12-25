{
  inputs = {
    nixpkgs-stable.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-25.11&shallow=1";
    nixpkgs-unstable.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-unstable&shallow=1";
    common.url = "./common";
    hardware.url = "./hardware";
    network.url = "./network";
    users.url = "./users";
    wireguard.url = "./wireguard";
    podman.url = "./podman";
    incus.url = "./incus";
  };
  outputs = {
    self,
    nixpkgs-stable,
    nixpkgs-unstable,
    common,
    hardware,
    network,
    users,
    wireguard,
    podman,
    incus,
  }:{
    nixosConfigurations = {
      server = nixpkgs-stable.lib.nixosSystem {
        modules = [
          common.nixosModules.server
          hardware.nixosModules.server
          network.nixosModules.server
          users.nixosModules.server
          wireguard.nixosModules.server
          incus.nixosModules.server
        ];
      };
      gateway = nixpkgs-stable.lib.nixosSystem{
        modules = [
          common.nixosModules.gateway
          hardware.nixosModules.gateway
          network.nixosModules.gateway
          users.nixosModules.gateway
          wireguard.nixosModules.gateway
          podman.nixosModules.gateway
        ];
      };
      laptop = nixpkgs-unstable.lib.nixosSystem {
        modules = [
          common.nixosModules.laptop
          hardware.nixosModules.laptop
          network.nixosModules.laptop
          users.nixosModules.laptop
        ];
      };
    };   
  };
}