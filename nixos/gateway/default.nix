{
  imports = [
    ../hardware.nix ./hardware.nix
    ../location.nix
    ../nix.nix
    ../network.nix
      ./hostname.nix
    ../users.nix
    ../wireguard.nix ./wireguard.nix
    ../podman.nix ./podman
  ];
}