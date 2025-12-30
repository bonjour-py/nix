{host, ...}:{
  imports = {
    server = [
      ./common
      ./hardware
      ./network
      ./users.nix
      ./wireguard
      ./incus
    ];
    gateway = [
      ./common
      ./hardware
      ./network
      ./users.nix
      ./wireguard
      ./podman
    ];
    laptop = [
      ./common
      ./wsl
    ];
  }.${host};
}