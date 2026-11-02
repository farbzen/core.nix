{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.corax = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.baseConfig
      self.nixosModules.bootEfi
      self.nixosModules.desktopHyprlandDux
      self.nixosModules.gamingSteam
      self.nixosModules.graphicsNvidia
      self.nixosModules.vpnWireguardTerra

      ./_disko-config.nix

      (
        {
          config,
          pkgs,
          ...
        }: {
          nixpkgs.overlays = [
            (final: prev: {
              handbrake =
                prev.handbrake.overrideAttrs
                (old: {
                  nativeBuildInputs = (old.nativeBuildInputs or []) ++ [pkgs.autoAddDriverRunpath];
                });
            })
          ];

          networking.hostName = "corax";
          hardware.facter.reportPath = ./facter.json;

          environment.systemPackages = with pkgs; [
            handbrake
            makemkv
            teamspeak6-client
          ];

          services.logind.settings.Login.HandleLidSwitch = "ignore";

          hardware.nvidia = {
            package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
            prime = {
              intelBusId = "PCI:0@0:2:0";
              nvidiaBusId = "PCI:1@0:0:0";
              offload = {
                enable = true;
                enableOffloadCmd = true;
              };
            };
          };
        }
      )
    ];
  };
}
