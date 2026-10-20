{pkgs, ...}:{
  imports = [
    ../../hardware.nix
    ../../location.nix
    ../../nix.nix
    ../../users.nix
    ./hardware.nix
    ./hostname.nix
    ./desktop.nix
  ];
}