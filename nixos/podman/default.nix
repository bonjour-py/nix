{host, ...}:{
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    defaultNetwork.settings = {
      network_interface = "podman";
      dns_enabled = true;
    };
  };
  networking.firewall.trustedInterfaces = ["podman"];
  imports = builtins.filter builtins.pathExists [ ./${host} ./${host}.nix ];
}