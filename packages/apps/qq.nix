{ stdenvNoCC, copyDesktopItems, appimageTools, fetchurl }: stdenvNoCC.mkDerivation rec {
  name = "QQ";
  src = appimageTools.wrapAppImage rec {
    inherit name;
    src = appimageTools.extract rec {
      pname = name;
      version = "3.2.32";
      src = fetchurl {
        url = "https://qqdl.gtimg.cn/qqfile/QQNT/9.9.33/release/3f89efc5/QQ_${version}_260812_x86_64_01.AppImage";
        hash = "sha256-MRBDUQ1k/ABu0lLOiufxM2YPH2eO/wHPJV4pB8H0LX8=";
      };
    };
    extraInstallCommands = ''substitute ${src}/qq.desktop $out/QQ.desktop --replace-fail "Exec=AppRun" "Exec=$out/bin/QQ" --replace-fail "Icon=/opt/QQ/resources/app/512x512.png" "Icon=${src}/qq.png"'';
  };
  nativeBuildInputs = [ copyDesktopItems ];
  desktopItems = [ "${src}/QQ.desktop" ];
}