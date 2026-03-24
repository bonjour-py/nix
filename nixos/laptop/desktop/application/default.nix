{pkgs, ...}:{
  imports = [
    ./flatpak.nix
    ./v2rayN.nix
  ];
  fonts = {
    packages = with pkgs;[
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    ];
    fontconfig.defaultFonts = {
      serif = ["Noto Serif CJK SC"];
      sansSerif = ["Noto Sans CJK SC"];
      monospace = ["Noto Sans Mono"];
    };
  };
}