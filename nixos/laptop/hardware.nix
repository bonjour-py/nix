{config, ...}:{
  boot.initrd.availableKernelModules = [ "ehci_pci" "nvme" "xhci_pci" "usbhid" "uas" "sd_mod" ];
  boot.kernelModules = [ "kvm-amd" ];
  hardware.cpu.amd.updateMicrocode = config.hardware.enableRedistributableFirmware;
  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;
  fileSystems = {
    "/boot" = {
      device = "UUID=12CE-A600";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
    "/" = {
      device = "UUID=4c5c3503-fb57-495e-a8f4-77ddcad57070";
      fsType = "btrfs";
      options = [ "subvol=@rootfs" "compress=zstd" ];
    };
    "/home" = {
      device = "UUID=4c5c3503-fb57-495e-a8f4-77ddcad57070";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" ];
    };
    "/nix" = {
      device = "UUID=4c5c3503-fb57-495e-a8f4-77ddcad57070";
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
      size = 16*1024;
    }
  ];
}
