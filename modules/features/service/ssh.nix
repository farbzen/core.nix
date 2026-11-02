{
  flake.nixosModules.serviceSSH = {
    services.openssh = {
      enable = true;
      settings.PermitRootLogin = "no";
    };
  };
}
