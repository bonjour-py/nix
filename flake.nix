{
  description = "bonjour";
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirrors.cernet.edu.cn/nix-channels/store"
    ];
  };
  inputs = {
    servers.url = "./servers";
  };

  outputs = {self, servers}:{
    nixosConfigurations = servers.nixosConfigurations;
  };
}