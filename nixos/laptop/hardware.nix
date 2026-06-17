{config, ...}:{
  boot = {
    initrd.availableKernelModules = [ "ehci_pci" "nvme" "xhci_pci" "usbhid" "uas" "sd_mod" ];
    kernelModules = [ "kvm-amd" ];
  };
  hardware.cpu.amd.updateMicrocode = config.hardware.enableRedistributableFirmware;
  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;
  fileSystems = {
    "/boot" = {
      device = "UUID=90F9-D672";
      fsType = "fat32";
      options = ["fmask=0077" "dmask=0077"];
    };
    "/" = {
      device = "UUID=8c614334-db09-407b-92db-baf04a74ec54";
      fsType = "btrfs";
      options = [ "subvol=@rootfs" "compress=zstd" ];
    };
    "/home" = {
      device = "UUID=8c614334-db09-407b-92db-baf04a74ec54";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" ];
    };
    "/nix" = {
      device = "UUID=8c614334-db09-407b-92db-baf04a74ec54";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime" ];
    };
  };
  services.btrfs.autoScrub = {
    enable = true;
    fileSystems = [ "/" ];
  };
  swapDevices = [
    {
      device = "/.swapfile";
      randomEncryption.enable = true;
      size = 16*1024;
    }
  ];
}
