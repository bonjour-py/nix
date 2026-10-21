{
  imports = [
    ../default/hardware.nix
    ../default/location.nix
    ../default/nix.nix
    ../default/network.nix
    ../default/users.nix
    ../default/ssh.nix
    ./hardware.nix
    ./hostname.nix
    ./wireguard
    ../default/wireguard.nix
    ./caddy
  ];
}