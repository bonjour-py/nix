{
  imports = [ 
    ../default/hardware.nix
    ../default/location.nix
    ../default/nix.nix
    ../default/network.nix
    ../default/users.nix
    ../default/wireguard.nix
    ../default/incus.nix
    ./hardware.nix
    ./network.nix
    ./hostname.nix
    ./wireguard.nix
    ./incus
  ];
}