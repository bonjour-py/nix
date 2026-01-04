{
  inputs = {
    server.url = "./server";
    gateway.url = "./gateway";
    laptop.url = "./laptop";
  };
  outputs = {self, server, gateway, laptop, ...}:{
    nixosConfigurations = {
      server = server.nixosConfigurations.server;
      gateway = gateway.nixosConfigurations.gateway;
      laptop = laptop.nixosConfigurations.laptop;
    };
  };
}