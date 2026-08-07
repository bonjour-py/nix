{
  services.caddy.virtualHosts."bonjour.zone".extraConfig = ''
    redir https://www.bonjour.zone{uri}
  '';
}