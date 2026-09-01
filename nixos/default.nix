{latest, stable, agenix}:{
  server = stable {
    modules = [
      agenix
      ./server
    ];
  };
  gateway = stable {
    modules = [
      agenix
      ./gateway
    ];
  };
  laptop = latest {
    modules = [
      agenix
      ./laptop
    ];
  };
}
