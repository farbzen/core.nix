{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.baseConfig = {
    lib,
    config,
    pkgs,
    ...
  }: let
    inherit (lib) mkDefault;
  in {
    imports = [
      inputs.disko.nixosModules.disko
      inputs.nix-index-database.nixosModules.default
      inputs.nur.modules.nixos.default
      inputs.sops.nixosModules.sops

      self.nixosModules.audioPulse
      self.nixosModules.basePackages
      self.nixosModules.editorNeovim
      self.nixosModules.firmwareAll
      self.nixosModules.hardwareBluetooth
      self.nixosModules.hardwarePowermanagement
      self.nixosModules.keymapUsIntl
      self.nixosModules.localeDe
      self.nixosModules.muxTmux
      self.nixosModules.networkManager
      self.nixosModules.nixSettings
      self.nixosModules.shellFish
      self.nixosModules.userFarbzen
      self.nixosModules.userRoot
      self.nixosModules.vpnOpenVPN
    ];

    fileSystems."/home".neededForBoot = true;
    hardware = {
      facter.enable = true;
      usb-modeswitch.enable = true;
    };

    networking.hostName = mkDefault "nixos";
    services.printing.enable = true;
    security.sudo.wheelNeedsPassword = false;
    system.stateVersion = "24.05";
  };
}
