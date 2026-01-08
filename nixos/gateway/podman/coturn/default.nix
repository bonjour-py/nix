{config, ...}:{
  age.secrets."turnserver.conf".file = "./turnserver.conf.age";
  virtualisation.oci-containers.containers.coturn = {
    image = "ghcr.io/coturn/coturn:alpine";
    pull = "newer";
    volumes = [
      "${config.age.secrets."turnserver.conf".path}:/etc/coturn/turnserver.conf:ro"
      "/root/coturn/cert.pem:/turn_server_cert.pem:ro"
      "/root/coturn/pkey.pem:/turn_server_pkey.pem:ro"
    ];
    user = "root";
    extraOptions = [
      "--uidmap=0:1000000:65535"
      "--dns-search=gateway.bonjour"
      "--hosts-file=none"
      "--tmpfs=/var/lib/coturn"
    ];
    environment = {
      DETECT_EXTERNAL_IP = "true";
      DETECT_RELAY_IP = "true";
    };
    cmd = [
      "--realm=bonjour.zone"
      "--use-auth-secret"
      "--min-port=62000"
      "--max-port=62099"
      "--no-udp"
      "--no-tcp"
      "--no-tcp-relay"
      "--user-quota=12"
      "--fingerprint"
      "--log-file=stdout"
    ];
    hostname = "coturn.gateway.bonjour";
    ports = [
      "5349:5349"
      "5349:5349/udp"
      "62000-62099:62000-62099/udp"
    ];
    labels = {"io.containers.autoupdate" = "registry";};
  };
}