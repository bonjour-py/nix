{pkgs, buildEnv}: buildEnv {
  name = "applications";
  paths = with pkgs;[
    remmina
    firefox
    waypipe
  ];
}