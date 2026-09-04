{latest, stable}: {
  default = latest.buildEnv {
    name = "bonjour-default";
    paths = [
      ( latest.callPackage ./apps {} )
      ( latest.callPackage ./work {} )
    ];
  };
}