{pkgs, fallbacks, buildEnv}: buildEnv {
  name = "appimage";
  paths = [
    (
      pkgs.appimage-run.override {
        extraPkgs = pkgs: with pkgs;[
          git
          libva
          ffmpeg
          libepoxy
        ];
      }
    )
    fallbacks.gearlever
  ];
}
