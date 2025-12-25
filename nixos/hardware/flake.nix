{
  inputs.wsl.url = "github:nix-community/NixOS-WSL/main";
  outputs = {self, wsl}:{
    nixosModules = {
      default = {
        nixpkgs.hostPlatform = "x86_64-linux";
        boot = {
          loader = {
            systemd-boot.enable = true;
            grub.enable = false;
            efi.canTouchEfiVariables = true;
          };
          tmp.useTmpfs = true;
        };
      };
      server = {config, ...}:{
        imports = [self.nixosModules.default];
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
      };
      gateway = {
        imports = [self.nixosModules.default];
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
      };
      laptop = {
        imports = [wsl.nixosModules.default];
        wsl.enable = true;
      };
    };
  };
}