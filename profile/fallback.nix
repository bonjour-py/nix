{pkgs}: pkgs.buildEnv {
  name = "apps";
  paths = with pkgs;[
	  gearlever
  ];
}