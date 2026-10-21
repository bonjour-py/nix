{
  services.caddy.virtualHosts = {
    "files.bonjour.zone".extraConfig = "reverse_proxy http://files.server.bonjour:9200";
    "http://bonjour-files.oss-cn-beijing-internal.aliyuncs.com".extraConfig = ''
      @local {
      	remote_ip 192.168.59.0/24
      }
      reverse_proxy @local https://oss-cn-beijing-internal.aliyuncs.com {
      	header_up Host bonjour-files.oss-cn-beijing-internal.aliyuncs.com
      }
    '';
  };
  networking.hosts."192.168.59.255" = ["bonjour-files.oss-cn-beijing-internal.aliyuncs.com"];
}