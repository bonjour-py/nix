{config, ...}:{
  imports = [ ./default.nix ];
  boot.initrd.availableKernelModules = ["ahci" "ehci_pci" "megaraid_sas" "usb_storage" "usbhid" "sd_mod"];
  hardware.cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
  fileSystems = {
    "/boot" = {
      device = "UUID=12CE-A600";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
    "/" = {
      device = "UUID=297e0847-bab9-4d30-90e0-6163e404ebcf";
      fsType = "btrfs";
      options = [ "subvol=@rootfs" "compress=zstd" ];
    };
    "/home" = {
      device = "UUID=297e0847-bab9-4d30-90e0-6163e404ebcf";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" ];
    };
    "/nix" = {
      device = "UUID=297e0847-bab9-4d30-90e0-6163e404ebcf";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime" ];
    };
  };
  services.btrfs.autoScrub = {
    enable = true;
    fileSystems = [ "/" ];
  };
}