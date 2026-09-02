{ appimageTools, fetchurl }: appimageTools.wrapAppImage rec {
  pname = "VSCode";
  version = "1.135.0";
  src = appimageTools.extract {
    inherit pname version;
    src = fetchurl {
      url = "https://github.com/valicm/VSCode-AppImage/releases/download/${version}/VSCode-x86_64.AppImage";
      hash = "sha256-uqZ4Dby/ULy/ZodAaA1nQH8RbHrAvaIq1kpuCJQ83w8=";
    };
  };
  extraPkgs = pkgs: [ pkgs.git ];
  extraInstallCommands = ''
    install -m 444 -D ${src}/VSCode.desktop $out/share/applications/VSCode.desktop
    install -m 444 -D ${src}/usr/share/icons/hicolor/512x512/apps/VSCode.png $out/share/icons/hicolor/512x512/apps/VSCode.png
    substituteInPlace $out/share/applications/VSCode.desktop --replace-fail 'Exec=code' 'Exec=VSCode' --replace-fail 'Icon=code' 'Icon=VSCode'
  '';
}