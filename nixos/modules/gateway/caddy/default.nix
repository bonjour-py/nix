{
  imports = [
    ./_apex.nix
    ./www.nix
    ./mail.nix
    ./vault.nix
    ./files.nix
  ];
  boot.kernel.sysctl = {
    "net.core.rmem_max" = 7500000;
    "net.core.wmem_max" = 7500000;
  };
  services.caddy = {
    enable = true;
    openFirewall = true;
    email = "bot@bonjour.zone";
    globalConfig = "grace_period 10s";
  };
}