{ stdenvNoCC, appimageTools, fetchurl, copyDesktopItems }: stdenvNoCC.mkDerivation rec {
  name = "FlClash";
  src = appimageTools.wrapAppImage rec {
    inherit name;
    src = appimageTools.extract rec {
      pname = name;
      version = "0.9.1";
      src = fetchurl {
        url = "https://github.com/chen08209/FlClash/releases/download/v${version}/FlClash-${version}-linux-amd64.AppImage";
        hash = "sha256-KxMlGR3eNl5gNu9Bqsb0Q65aFdxp+sYdxNNd2XKfkKM=";
      };
    };
    extraPkgs = pkgs: [ pkgs.libepoxy ];
    extraInstallCommands = ''substitute ${src}/FlClash.desktop $out/FlClash.desktop --replace-fail "Exec=LD_LIBRARY_PATH=usr/lib FlClash" "Exec=$out/bin/FlClash" --replace-fail "Icon=FlClash" "Icon=${src}/FlClash.png"'';
  };
  nativeBuildInputs = [ copyDesktopItems ];
  desktopItems = [ "${src}/FlClash.desktop" ];
  postInstall = ''
    mkdir -p $out/etc/xdg/autostart
    substitute ${src}/FlClash.desktop $out/etc/xdg/autostart/FlClash.desktop --replace-fail " %u" "" --replace-fail "StartupNotify=true" "StartupNotify=false"
  '';
}