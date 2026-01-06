{
  imports = [
    ../default/hardware.nix
    ../default/location.nix
    ../default/nix.nix
    ../default/network.nix
    ../default/users.nix
    ../default/wireguard.nix
    ../default/podman.nix
    ./hardware.nix
    ./hostname.nix
    ./wireguard.nix
    ./podman
  ];
}