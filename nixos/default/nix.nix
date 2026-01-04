{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://mirrors.cernet.edu.cn/nix-channels/store" ];
    };
    gc.automatic = true;
  };
}