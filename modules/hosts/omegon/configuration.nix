{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.omegon = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.baseConfig
      self.nixosModules.bootEfi
      self.nixosModules.desktopHyprlandDux
      self.nixosModules.gamingSteam
      self.nixosModules.serviceSSH
      self.nixosModules.vmQemu
      self.nixosModules.vpnOpenVPNTzeentch
      self.nixosModules.vpnOpenVPNNurgle
      self.nixosModules.vpnWireguardTerra

      ./_disko-config.nix

      (
        {pkgs, ...}: {
          networking.hostName = "omegon";
          hardware.facter.reportPath = ./facter.json;
          environment.systemPackages = with pkgs; [
            remmina
            seafile-client
            teamspeak6-client
            teams-for-linux
            thunderbird
            tpm2-tss

            inputs.mixedupmh.packages.${stdenv.hostPlatform.system}.mixedupmh
          ];

          virtualisation.docker.enable = true;
          services = {
            logind.settings.Login.HandleLidSwitch = "ignore";
            openssh = {
              ports = [8022];
              openFirewall = false;
            };
          };
        }
      )
    ];
  };
}
