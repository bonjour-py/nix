{ runCommand, appimageTools, fetchurl }: appimageTools.wrapAppImage rec {
  name = "QQ";
  src = appimageTools.extract rec {
    pname = name;
    version = "9.9.33";
    src = fetchurl {
      url = "https://qqdl.gtimg.cn/qqfile/QQNT/${version}/release/3f89efc5/QQ_3.2.32_260812_x86_64_01.AppImage";
      hash = "sha256-MRBDUQ1k/ABu0lLOiufxM2YPH2eO/wHPJV4pB8H0LX8=";
    };
  };
  extraInstallCommands = ''
    install -m 444 -D ${src}/qq.desktop $out/share/applications/QQ.desktop
    install -m 444 -D ${src}/usr/share/icons/hicolor/512x512/apps/qq.png $out/share/icons/hicolor/512x512/apps/QQ.png
    substituteInPlace $out/share/applications/QQ.desktop --replace-fail 'Exec=AppRun' 'Exec=QQ' --replace-fail 'Icon=/opt/QQ/resources/app/512x512.png' 'Icon=QQ'
  '';
}