{ appimageTools, fetchurl }: appimageTools.wrapAppImage rec {
  pname = "OwnCloud";
  version = "7.1.0";
  src = appimageTools.extract {
    inherit pname version;
    src = fetchurl {
      url = "https://download.owncloud.com/desktop/ownCloud/stable/7.1/linux-appimage/ownCloud-${version}.19041-x86_64.AppImage";
      hash = "sha256-aCeCR0nobEx2Zvr8JDJpPYH2ZjGZjFH2Nid2vdikcM4=";
    };
  };
  extraInstallCommands = ''
    install -m 444 -D ${src}/owncloud.desktop $out/share/applications/OwnCloud.desktop
    install -m 444 -D ${src}/usr/share/icons/hicolor/256x256/apps/owncloud.png $out/share/icons/hicolor/256x256/apps/OwnCloud.png
    substituteInPlace $out/share/applications/OwnCloud.desktop --replace-fail 'Exec=owncloud' 'Exec=OwnCloud' --replace-fail 'Icon=owncloud' 'Icon=OwnCloud'
  '';
}