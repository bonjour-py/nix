{
  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_blk" ];
  fileSystems = {
    "/boot" = {
      device = "UUID=27C5-280F";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
    "/" = {
      device = "UUID=8706d89b-ddfb-4b89-8aac-394e2373bc05";
      fsType = "ext4";
    };
  };
  swapDevices = [{device = "/dev/disk/by-uuid/26c12c19-1373-4697-b6a6-9428e7039509";}];
}