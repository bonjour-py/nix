{config, ...}:{
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.11";
  hardware.cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
  boot = {
    initrd.availableKernelModules = ["ahci" "ehci_pci" "megaraid_sas" "usb_storage" "usbhid" "sd_mod"];
    loader = {
      grub.enable = false;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}