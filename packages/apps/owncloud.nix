{ stdenvNoCC, appimageTools, fetchurl, copyDesktopItems, makeDesktopItem }: stdenvNoCC.mkDerivation rec {
  name = "OwnCloud";
  src = appimageTools.wrapAppImage rec {
    inherit name;
    src = appimageTools.extract rec {
      pname = name;
      version = "7.1.0";
      src = fetchurl {
        url = "https://download.owncloud.com/desktop/ownCloud/stable/7.1/linux-appimage/ownCloud-${version}.19041-x86_64.AppImage";
        hash = "sha256-aCeCR0nobEx2Zvr8JDJpPYH2ZjGZjFH2Nid2vdikcM4=";
      };
    };
    extraInstallCommands = ''substitute ${src}/owncloud.desktop $out/OwnCloud.desktop --replace-fail "Exec=owncloud" "Exec=$out/bin/OwnCloud" --replace-fail "Icon=owncloud" "Icon=${src}/owncloud.png"'';
  };
  nativeBuildInputs = [ copyDesktopItems ];
  desktopItems = [ "${src}/OwnCloud.desktop" ];
  postInstall = ''
    mkdir -p $out/etc/xdg/autostart
    ln -s ${
      makeDesktopItem {
        name = "OwnCloud-autostart";
        desktopName = "ownCloud";
        genericName = "File Synchronizer";
        comment = "CuteCloud startup script";
        exec = "${src}/bin/OwnCloud";
      }
    }/share/applications/OwnCloud-autostart.desktop $out/etc/xdg/autostart/OwnCloud.desktop
  '';
}