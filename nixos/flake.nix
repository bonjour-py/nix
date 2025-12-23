{
  inputs = {
    server.url = "./server";
    gateway.url = "./gateway";
  };
  outputs = {self, server, gateway}:{
    nixosConfigurations = {
      server = server.nixosConfigurations.server;
      gateway = server.nixosConfigurations.gateway;
    };
  };
}