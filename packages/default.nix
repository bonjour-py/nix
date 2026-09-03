{latest, stable}: {
  default = latest.buildEnv {
    name = "bonjour-default";
    paths = [
      ( latest.callPackage ./work {} ).all
      ( latest.callPackage ./apps {} ).all
    ];
  };
}