{pkgs, ...}:{
  imports = [
    ../default/hardware.nix
    ../default/location.nix
    ../default/nix.nix
    ../default/users.nix
    ./hardware.nix
    ./hostname.nix
    ./desktop
  ];
}