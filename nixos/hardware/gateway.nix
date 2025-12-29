{
  imports = [ ./default.nix ];
  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_blk" ];
  fileSystems = {
    "/boot" = {
      device = "/dev/vda1";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
    "/" = {
      device = "/dev/vda2";
      fsType = "ext4";
    };
  };
  swapDevices = [{device = "/dev/vda3";}];
}