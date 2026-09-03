{ appimageTools, fetchurl }: appimageTools.wrapAppImage rec {
  pname = "Bitwarden";
  version = "2026.8.0";
  src = appimageTools.extract {
    inherit pname version;
    src = fetchurl {
      url = "https://github.com/bitwarden/clients/releases/download/desktop-v${version}/Bitwarden-${version}-x86_64.AppImage";
      hash = "sha256-OfoOjqhjaShrUGLiPjYt2ISxBESLoJpITvWKPTevTfo=";
    };
  };
  extraInstallCommands = ''
    install -m 444 -D ${src}/bitwarden.desktop $out/share/applications/Bitwarden.desktop
    install -m 444 -D ${src}/usr/share/icons/hicolor/512x512/apps/bitwarden.png $out/share/icons/hicolor/512x512/apps/Bitwarden.png
    substituteInPlace $out/share/applications/Bitwarden.desktop --replace-fail 'Exec=AppRun' 'Exec=Bitwarden' --replace-fail 'Icon=bitwarden' 'Icon=Bitwarden'
  '';
}