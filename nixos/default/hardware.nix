{
  system.stateVersion = "25.11";
  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.enableRedistributableFirmware = true;
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      grub.enable = false;
      efi.canTouchEfiVariables = true;
    };
    tmp.useTmpfs = true;
  };
}
