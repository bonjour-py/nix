{ stdenvNoCC, appimageTools, fetchurl, copyDesktopItems, makeDesktopItem }: stdenvNoCC.mkDerivation rec {
  name = "Bitwarden";
  src = appimageTools.wrapAppImage rec {
    inherit name;
    src = appimageTools.extract rec {
      pname = name;
      version = "2026.9.1";
      src = fetchurl {
        url = "https://github.com/bitwarden/clients/releases/download/desktop-v${version}/Bitwarden-${version}-x86_64.AppImage";
        hash = "sha256-rDXASNnIQl0HFMf/xgpg78h+s1lFVbipI7dDinJHlUk=";
      };
    };
    extraInstallCommands = ''substitute ${src}/bitwarden.desktop $out/Bitwarden.desktop --replace-fail "Exec=AppRun" "Exec=$out/bin/Bitwarden" --replace-fail "Icon=bitwarden" "Icon=${src}/bitwarden.png"'';
  };
  nativeBuildInputs = [ copyDesktopItems ];
  desktopItems = [ "${src}/Bitwarden.desktop" ];
  postInstall = ''
    mkdir -p $out/etc/xdg/autostart
    substitute ${src}/Bitwarden.desktop $out/etc/xdg/autostart/Bitwarden.desktop --replace-fail "--no-sandbox %U" "--autostart"
  '';
}