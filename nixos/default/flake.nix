{
  outputs = {self}:{
    nixosModules = {
      hardware = ./hardware.nix;
      location = ./location.nix;
      nix = ./nix.nix;
      network = ./network.nix;
      users = ./users.nix;
      wireguard = ./wireguard.nix;
      podman = ./podman.nix;
      incus = ./incus.nix;
    };
  };
}