{
  services.caddy.virtualHosts = {
    "vault.bonjour.zone".extraConfig = "reverse_proxy http://vault.server.bonjour:8000";
    "http://bonjour-vault.oss-cn-beijing-internal.aliyuncs.com".extraConfig = ''
      @local {
      	remote_ip 192.168.59.0/24
      }
      reverse_proxy @local https://oss-cn-beijing-internal.aliyuncs.com {
      	header_up Host bonjour-vault.oss-cn-beijing-internal.aliyuncs.com
      }
    '';
  };
  networking.hosts."192.168.59.255" = ["bonjour-vault.oss-cn-beijing-internal.aliyuncs.com"];
}