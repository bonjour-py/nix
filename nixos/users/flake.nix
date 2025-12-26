{
  outputs = {self}:{
    nixosModules = {
      default = {
        users = {
          mutableUsers = false;
          users.bonjour = {
            isNormalUser = true;
            description = "Bonjour LI";
            hashedPassword = "$y$j9T$TiI2gRzfV.zzEFYZm493v0$ig74Wc4bXVX5OQngOf4sbNiUaPET8MLzC7RHytD5ow7";
            openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFU1BO8fzrt6bmud/+q/Jqm7UK8hXJZvA7wCIi11Cec+ BonjourLI"];
            extraGroups = [ "wheel" ];
          };
        };
        services.openssh = {
          enable = true;
          settings.PasswordAuthentication = false;
        };
      };
      server = self.nixosModules.default;
      gateway = self.nixosModules.default;
      laptop.wsl.defaultUser = "bonjour";
    };
  };
}