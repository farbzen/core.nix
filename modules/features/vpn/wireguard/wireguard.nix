{
  flake.nixosModules.vpnWireguardTerra = {config, ...}: let
    configFile = "wg-terra.conf";
    sopsFile = ../../../../.secrets/wireguard.yaml;
  in {
    sops = {
      secrets = {
        terra_ep.sopsFile = sopsFile;
        terra_address.sopsFile = sopsFile;
        terra_allowedips.sopsFile = sopsFile;
        terra_priv.sopsFile = sopsFile;
        terra_pub.sopsFile = sopsFile;
        terra_psk.sopsFile = sopsFile;
        terra_dns.sopsFile = sopsFile;
      };

      templates.${configFile}.content = ''
        [Interface]
        PrivateKey = ${config.sops.placeholder.terra_priv}
        Address = ${config.sops.placeholder.terra_address}
        ${config.sops.placeholder.terra_dns}

        [Peer]
        PublicKey = ${config.sops.placeholder.terra_pub}
        PresharedKey = ${config.sops.placeholder.terra_psk}
        AllowedIPs = ${config.sops.placeholder.terra_allowedips}
        Endpoint = ${config.sops.placeholder.terra_ep}
        PersistentKeepalive = 25
      '';
    };

    networking.wg-quick.interfaces."wg-terra" = {
      autostart = false;
      configFile = config.sops.templates.${configFile}.path;
    };
  };
}
