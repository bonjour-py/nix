{home-manager, ...}:{
  imports = [ home-manager ];
  wsl.defaultUser = "bonjour";
  home-manager.users.bonjour = {
    home.stateVersion = "25.11";
  };
}