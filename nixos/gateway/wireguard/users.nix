{config, ...}:{
  age.secrets = {
    "wireguard/gateway-yunoki.preshared" = {
      file = ./gateway-yunoki.preshared.age;
      group = "systemd-network";
      mode = "640";
    };
    "wireguard/gateway-kanoi.preshared" = {
      file = ./gateway-kanoi.preshared.age;
      group = "systemd-network";
      mode = "640";
    };
  };
  networking.wireguard.interfaces.wireguard.peers = [
    {
      publicKey = "jONbtJPcVxavD+LsTb0Ab1iNzDco5dvGA62GxoTW/Wc=";
      presharedKeyFile = config.age.secrets."wireguard/gateway-yunoki.preshared".path;
      allowedIPs = ["192.168.59.241/32"];
    }
    {
      publicKey = "1W+Uz05wl5DK8SbMpYg0ujRMRL7UAxXf7LGlA4D45XY=";
      presharedKeyFile = config.age.secrets."wireguard/gateway-kanoi.preshared".path;
      allowedIPs = ["192.168.59.242/32"];
    }
  ];
}