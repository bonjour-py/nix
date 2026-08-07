{
  services.caddy.virtualHosts."www.bonjour.zone".extraConfig = ''
    reverse_proxy https://bonjour-www.oss-cn-beijing-internal.aliyuncs.com {
    	header_up Host bonjour-www.oss-cn-beijing-internal.aliyuncs.com
    	header_down -Content-Disposition
    }
  '';
}