{host, wsl?null, ...}:{
  nixpkgs.hostPlatform = "x86_64-linux";
  boot = {
    loader = {
      systemd-boot.enable = true;
      grub.enable = false;
      efi.canTouchEfiVariables = true;
    };
    tmp.useTmpfs = true;
  };
  imports = builtins.filter builtins.pathExists [ ./${host}.nix ];
}