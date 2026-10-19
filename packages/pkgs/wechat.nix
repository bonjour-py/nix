{ stdenvNoCC, appimageTools, fetchurl, copyDesktopItems }: stdenvNoCC.mkDerivation rec {
  name = "WeChat";
  src = appimageTools.wrapAppImage rec {
    inherit name;
    src = appimageTools.extract rec {
      pname = name;
      version = "4.1.13";
      src = fetchurl {
        url = "https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.AppImage";
        hash = "sha256-RSYYC8qYASh5FZmvEi/0eVACpXFaUQ9qZUgOK+aHQkQ=";
      };
    };
    extraInstallCommands = ''substitute ${src}/wechat.desktop $out/WeChat.desktop --replace-fail "Exec=AppRun" "Exec=$out/bin/WeChat" --replace-fail "Icon=wechat" "Icon=${src}/wechat.png"'';
  };
  nativeBuildInputs = [ copyDesktopItems ];
  desktopItems = [ "${src}/WeChat.desktop" ];
}