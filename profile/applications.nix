{pkgs, buildEnv}: buildEnv {
  name = "apps";
  paths = with pkgs;[
    remmina
    firefox
    waypipe
  ];
}