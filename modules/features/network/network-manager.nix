{
  flake.nixosModules.networkManager = {
    config,
    pkgs,
    ...
  }: {
    networking.networkmanager = {
      enable = true;
      plugins = [pkgs.networkmanager-openvpn];
    };

    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
