{
  flake.nixosModules.vpnOpenVPNNurgle = {config, ...}: let
    configFile = "openvpn-nurgle.conf";
    sopsFile = ../../../../.secrets/openvpn.yaml;
  in {
    sops = {
      secrets = {
        nurgle_remote.sopsFile = sopsFile;
        nurgle_ca.sopsFile = sopsFile;
        nurgle_cert.sopsFile = sopsFile;
        nurgle_key.sopsFile = sopsFile;
        nurgle_aup.sopsFile = sopsFile;
        nurgle_routes.sopsFile = sopsFile;
      };

      templates.${configFile}.content = ''
        dev tun
        client
        proto udp
        <ca>
        ${config.sops.placeholder.nurgle_ca}
        </ca>
        <cert>
        ${config.sops.placeholder.nurgle_cert}
        </cert>
        <key>
        ${config.sops.placeholder.nurgle_key}
        </key>
        remote-cert-eku "TLS Web Server Authentication"
        remote ${config.sops.placeholder.nurgle_remote}
        persist-key
        persist-tun
        verb 3
        mute 20
        keepalive 10 60
        cipher AES-256-GCM
        float
        reneg-sec 28800
        nobind
        mute-replay-warnings
        <auth-user-pass>
        ${config.sops.placeholder.nurgle_aup}
        </auth-user-pass>
        explicit-exit-notify 2
        tls-version-min 1.2
        pull-filter ignore block-outside-dns
        pull-filter ignore redirect-gateway
        ${config.sops.placeholder.nurgle_routes}
      '';
    };

    services.openvpn.servers."nurgle" = {
      autoStart = false;
      config = ''config ${config.sops.templates.${configFile}.path}'';
    };
  };
}
