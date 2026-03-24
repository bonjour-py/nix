{pkgs, ...}:{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs;[
      icu
      fontconfig
      libx11
      libice
      libsm
    ];
  };
}