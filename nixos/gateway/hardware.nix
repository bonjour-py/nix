{
  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_blk" ];
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
    "/" = {
      device = "/dev/disk/by-label/root";
      fsType = "ext4";
    };
  };
  swapDevices = [{device = "/dev/disk/by-label/swap";}];
}