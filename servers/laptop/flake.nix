{
  description = "bonjour laptop (WSL)";
  inputs = {
    nixpkgs.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-unstable&shallow=1";
    nixos.url = "../../nixos";
  };

  outputs = { self, nixpkgs, nixos}: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {modules = [nixos.nixosModules.laptop];};
  };
}