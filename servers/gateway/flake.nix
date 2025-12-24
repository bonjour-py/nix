{
  description = "bonjour gateway";
  inputs = {
    nixpkgs.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-25.11&shallow=1";
    nixos.url = "../../nixos";
  };

  outputs = {self, nixpkgs, nixos}:{
    nixosConfigurations.gateway = nixpkgs.lib.nixosSystem{modules = [nixos.nixosModules.gateway];};
  };
}