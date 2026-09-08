{ stdenvNoCC, appimageTools, fetchurl, copyDesktopItems, makeDesktopItem }: stdenvNoCC.mkDerivation rec {
  name = "CuteCloud";
  src = appimageTools.wrapAppImage rec {
    inherit name;
    src = appimageTools.extract rec {
      pname = name;
      version = "0.8.92";
      src = fetchurl {
        url = "https://dl.cutecloud.net/CuteCloud-${version}-linux-x64.AppImage";
        hash = "sha256-crQlYZGCm9KX4dlj7sy0oF0dmc5J8UN5+SmutgT2+9g=";
      };
    };
    extraPkgs = pkgs: [ pkgs.libepoxy ];
    extraInstallCommands = ''substitute ${src}/CuteCloud.desktop $out/CuteCloud.desktop --replace-fail "Exec=LD_LIBRARY_PATH=usr/lib CuteCloud" "Exec=$out/bin/CuteCloud" --replace-fail "Icon=CuteCloud" "Icon=${src}/CuteCloud.png"'';
  };
  nativeBuildInputs = [ copyDesktopItems ];
  desktopItems = [ "${src}/CuteCloud.desktop" ];
  postInstall = ''
    mkdir -p $out/etc/xdg/autostart
    ln -s ${
      makeDesktopItem {
        name = "CuteCloud-autostart";
        desktopName = "CuteCloud";
        comment = "CuteCloud startup script";
        exec = "${src}/bin/CuteCloud";
      }
    }/share/applications/CuteCloud-autostart.desktop $out/etc/xdg/autostart/CuteCloud.desktop
  '';
}