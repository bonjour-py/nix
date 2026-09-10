{config, ...}:{
  boot.initrd.availableKernelModules = ["ahci" "ehci_pci" "megaraid_sas" "usb_storage" "usbhid" "sd_mod"];
  hardware.cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
  fileSystems = {
    "/boot" = {
      device = "UUID=12CE-A600";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
    "/" = {
      device = "UUID=df0b2bea-b75f-4d7a-a94c-8fb4994e43df";
      fsType = "btrfs";
      options = [ "subvol=@rootfs" "compress=zstd" ];
    };
    "/home" = {
      device = "UUID=df0b2bea-b75f-4d7a-a94c-8fb4994e43df";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" ];
    };
    "/nix" = {
      device = "UUID=df0b2bea-b75f-4d7a-a94c-8fb4994e43df";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime" ];
    };
  };
  services.btrfs.autoScrub = {
    enable = true;
    fileSystems = [ "/" ];
  };
}