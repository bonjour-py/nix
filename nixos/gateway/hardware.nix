{
  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_blk" ];
  fileSystems = {
    "/boot" = {
      device = "UUID=3D8C-2E2A";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
    "/" = {
      device = "UUID=d28ca22c-57ff-4343-88d3-fee40011d251";
      fsType = "ext4";
    };
  };
  swapDevices = [{device = "/dev/disk/by-uuid/afce08be-b0a5-4bc8-b8ca-3ff0df623cda";}];
}