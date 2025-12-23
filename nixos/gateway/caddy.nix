{
  boot.kernel.sysctl = {
    "net.core.rmem_max" = 7500000;
    "net.core.wmem_max" = 7500000;
  };
  environment.etc."caddy/Caddyfile" = {
    mode = "0644";
    text = ''
      {
      	admin off
      	grace_period 10s
      	email bot@bonjour.zone
      }
      bonjour.zone {
      	redir /.well-known/matrix/* https://chat.bonjour.zone{uri}
      	redir https://www.bonjour.zone{uri}
      }
      www.bonjour.zone {
      	reverse_proxy https://bonjour-zone-www.oss-cn-beijing-internal.aliyuncs.com {
      		header_up Host bonjour-zone-www.oss-cn-beijing-internal.aliyuncs.com
      		header_down -Content-Disposition
      	}
      }
      mail.bonjour.zone {
      	reverse_proxy https://qiye.aliyun.com
      }
      vault.bonjour.zone {
      	reverse_proxy http://vault.server.bonjour
      }
      files.bonjour.zone {
      	reverse_proxy http://files.server.bonjour:9200
      }
      chat.bonjour.zone {
      	reverse_proxy http://chat.server.bonjour
      }
      turn.bonjour.zone {
      	abort
      }
      http://*.oss-cn-beijing-internal.aliyuncs.com {
      	reverse_proxy https://oss-cn-beijing-internal.aliyuncs.com {
      		header_up Host {host}
      	}
      }
    '';
  };
  systemd.tmpfiles.settings.caddy."/root/caddy"."0" = {
    type = "Z";
    user = "1000000";
  };
  virtualisation.oci-containers.containers.caddy = {
    image = "public.ecr.aws/docker/library/caddy:latest";
    pull = "newer";
    volumes = [
      "/etc/caddy:/etc/caddy:ro"
      "/root/caddy:/data/caddy"
    ];
    extraOptions = [
      "--uidmap=0:1000000:65535"
      "--dns-search=gateway.bonjour"
      "--hosts-file=none"
      "--stop-timeout=15"
    ];
    hostname = "caddy.gateway.bonjour";
    ports = [
      "80:80"
      "443:443"
      "443:443/udp"
    ];
    labels = {"io.containers.autoupdate" = "registry";};
  };
  networking.hosts."192.168.59.255" = [
    "bonjour-vault.oss-cn-beijing-internal.aliyuncs.com"
    "bonjour-files.oss-cn-beijing-internal.aliyuncs.com"
    "bonjour-chat.oss-cn-beijing-internal.aliyuncs.com"
  ];
}