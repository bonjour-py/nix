{
  users.users.bonjour = {
    isNormalUser = true;
    description = "Bonjour LI";
    password = "bonjourli";
    openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFU1BO8fzrt6bmud/+q/Jqm7UK8hXJZvA7wCIi11Cec+ BonjourLI"];
    extraGroups = [ "wheel" ];
  };
}