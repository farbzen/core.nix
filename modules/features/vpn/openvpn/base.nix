{
  flake.nixosModules.vpnOpenVPN = {
    config,
    pkgs,
    ...
  }: {
    services.openvpn.package = pkgs.openvpn.overrideAttrs (old: {
      configureFlags =
        (old.configureFlags or [])
        ++ [
          "SYSTEMD_ASK_PASSWORD=${config.systemd.package}/bin/systemd-ask-password"
        ];
    });
  };
}
