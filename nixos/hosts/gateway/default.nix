{
  imports = [
    ../../hardware.nix
    ../../location.nix
    ../../nix.nix
    ../../network.nix
    ../../users.nix
    ../../ssh.nix
    ./hardware.nix
    ./hostname.nix
    ./wireguard
    ../../wireguard.nix
    ./caddy
  ];
}