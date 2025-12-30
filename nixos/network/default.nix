{host, ...}:{
  networking = {
    useNetworkd = true;
    nftables.enable = true;
  };
  imports = builtins.filter builtins.pathExists [ ./${host} ./${host}.nix ];
}