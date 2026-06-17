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
      device = "UUID=23B1-5D54";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
    "/" = {
      device = "UUID=bf01ebe2-3471-49b6-9999-e150fd85a72e";
      fsType = "btrfs";
      options = [ "subvol=@rootfs" "compress=zstd" ];
    };
    "/home" = {
      device = "UUID=bf01ebe2-3471-49b6-9999-e150fd85a72e";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" ];
    };
    "/nix" = {
      device = "UUID=bf01ebe2-3471-49b6-9999-e150fd85a72e";
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
