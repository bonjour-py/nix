{ appimageTools, fetchurl }: appimageTools.wrapAppImage rec {
  name = "VSCode";
  src = appimageTools.extract rec {
    pname = name;
    version = "1.136.1";
    src = fetchurl {
      url = "https://github.com/valicm/VSCode-AppImage/releases/download/${version}/VSCode-x86_64.AppImage";
      hash = "sha256-887+kWoOuLa+o3dIrmekSdF3y3+Z7EPrqj0HwNhhBWc=";
    };
  };
  extraPkgs = pkgs: [ pkgs.git ];
  extraInstallCommands = ''
    install -m 444 -D ${src}/VSCode.desktop $out/share/applications/VSCode.desktop
    install -m 444 -D ${src}/usr/share/icons/hicolor/512x512/apps/VSCode.png $out/share/icons/hicolor/512x512/apps/VSCode.png
    substituteInPlace $out/share/applications/VSCode.desktop --replace-fail 'Exec=code' 'Exec=VSCode' --replace-fail 'Icon=code' 'Icon=VSCode'
  '';
}