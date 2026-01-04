{
  inputs = {
    default.url = "./default";
    server = {
      url = "./server";
      inputs.default.follows = "default";
    };
    gateway = {
      url = "./gateway";
      inputs.default.follows = "default";
    };
    laptop = {
      url = "./laptop";
      inputs.default.follows = "default";
    };
  };
  outputs = {self, server, gateway, laptop, ...}:{
    nixosConfigurations = {
      server = server.nixosConfigurations.server;
      gateway = gateway.nixosConfigurations.gateway;
      laptop = laptop.nixosConfigurations.laptop;
    };
  };
}