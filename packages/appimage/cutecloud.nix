{ appimageTools, fetchurl }: appimageTools.wrapAppImage rec {
  pname = "CuteCloud";
  version = "0.8.92";
  src = appimageTools.extract {
    inherit pname version;
    src = fetchurl {
      url = "https://dl.cutecloud.net/CuteCloud-${version}-linux-x64.AppImage";
      hash = "sha256-crQlYZGCm9KX4dlj7sy0oF0dmc5J8UN5+SmutgT2+9g=";
    };
  };
  extraPkgs = pkgs: [ pkgs.libepoxy ];
  extraInstallCommands = ''
    install -m 444 -D ${src}/CuteCloud.desktop $out/share/applications/CuteCloud.desktop
    install -m 444 -D ${src}/usr/share/icons/hicolor/256x256/apps/CuteCloud.png $out/share/icons/hicolor/256x256/apps/CuteCloud.png
    substituteInPlace $out/share/applications/CuteCloud.desktop --replace-fail 'Exec=LD_LIBRARY_PATH=usr/lib CuteCloud' 'Exec=CuteCloud'
  '';
}