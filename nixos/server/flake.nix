{
  description = "bonjour server";
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    extra-substituters = [
      "https://mirrors.cernet.edu.cn/nix-channels/store"
    ];
  };
  inputs.nixpkgs.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-25.11&shallow=1";

  outputs = {self, nixpkgs}:{
    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      modules = [
        ./hardware.nix
        ./nix.nix
        ./filesystem.nix
        ./location.nix
        ./network.nix
        ./wireguard.nix
        ./users.nix
        ./ssh.nix
        ./incus.nix
      ];
    };
  };
}