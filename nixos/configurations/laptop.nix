{latest, hardware, agenix, ...}: latest {
  modules = [
    hardware.lenovo-thinkpad-t14-amd-gen3
    agenix
    ../modules/laptop
  ];
}