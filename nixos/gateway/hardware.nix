{
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.11";
  boot = {
    loader = {
      systemd-boot.enable = true;
      grub.enable = false;
      efi.canTouchEfiVariables = true;
    };
    initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_blk" ];
  };
}