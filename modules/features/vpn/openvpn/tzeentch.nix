{
  flake.nixosModules.vpnOpenVPNTzeentch= {config, ...}: let
    configFile = "openvpn-tzeentch.conf";
    sopsFile = ../../../../.secrets/openvpn.yaml;
  in {
    sops = {
      secrets = {
        tzeentch_remote.sopsFile = sopsFile;
        tzeentch_subject.sopsFile = sopsFile;
        tzeentch_username.sopsFile = sopsFile;
        tzeentch_ca.sopsFile = sopsFile;
        tzeentch_cert.sopsFile = sopsFile;
        tzeentch_key.sopsFile = sopsFile;
        tzeentch_tlscrypt.sopsFile = sopsFile;
        tzeentch_pushoptions.sopsFile = sopsFile;
      };

      templates.${configFile}.content = ''
        dev tun
        persist-tun
        persist-key
        client
        ping-restart 0
        resolv-retry infinite
        reneg-sec 43200
        lport 0
        remote-cert-tls server
        remote ${config.sops.placeholder.tzeentch_remote}
        verify-x509-name ${config.sops.placeholder.tzeentch_subject}
        <auth-user-pass>
        ${config.sops.placeholder.tzeentch_username}
        </auth-user-pass>
        <ca>
        ${config.sops.placeholder.tzeentch_ca}
        </ca>
        <cert>
        ${config.sops.placeholder.tzeentch_cert}
        </cert>
        <key>
        ${config.sops.placeholder.tzeentch_key}
        </key>
        <tls-crypt>
        ${config.sops.placeholder.tzeentch_tlscrypt}
        </tls-crypt>
        ${config.sops.placeholder.tzeentch_pushoptions}
      '';
    };

    services.openvpn.servers."tzeentch" = {
      autoStart = false;
      config = ''config ${config.sops.templates.${configFile}.path} '';
      updateResolvConf = true;
    };
  };
}
