{ stdenvNoCC, copyDesktopItems, appimageTools, fetchurl }: stdenvNoCC.mkDerivation rec {
  name = "VSCode";
  src = appimageTools.wrapAppImage rec {
    inherit name;
    src = appimageTools.extract rec {
      pname = name;
      version = "1.136.1";
      src = fetchurl {
        url = "https://github.com/valicm/VSCode-AppImage/releases/download/${version}/VSCode-x86_64.AppImage";
        hash = "sha256-887+kWoOuLa+o3dIrmekSdF3y3+Z7EPrqj0HwNhhBWc=";
      };
    };
    extraPkgs = pkgs: [ pkgs.git ];
    extraInstallCommands = ''substitute ${src}/VSCode.desktop $out/VSCode.desktop --replace-fail "Exec=code" "Exec=$out/bin/VSCode" --replace-fail "Icon=code" "Icon=${src}/code.png"'';
  };
  nativeBuildInputs = [ copyDesktopItems ];
  desktopItems = [ "${src}/VSCode.desktop" ];
}