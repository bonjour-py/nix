{ stdenvNoCC, appimageTools, fetchurl, copyDesktopItems }: stdenvNoCC.mkDerivation rec {
  name = "VSCode";
  src = appimageTools.wrapAppImage rec {
    inherit name;
    src = appimageTools.extract rec {
      pname = name;
      version = "1.136.2";
      src = fetchurl {
        url = "https://github.com/valicm/VSCode-AppImage/releases/download/${version}/VSCode-x86_64.AppImage";
        hash = "sha256-K9ST0A4LdlE4Qjs4trdVcSZLVfjMUjxA8ZvlNeIL6KA=";
      };
    };
    extraPkgs = pkgs: [ pkgs.git ];
    extraInstallCommands = ''substitute ${src}/VSCode.desktop $out/VSCode.desktop --replace-fail "Exec=code" "Exec=$out/bin/VSCode" --replace-fail "Icon=code" "Icon=${src}/code.png"'';
  };
  nativeBuildInputs = [ copyDesktopItems ];
  desktopItems = [ "${src}/VSCode.desktop" ];
}