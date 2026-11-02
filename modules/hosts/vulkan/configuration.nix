{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.vulkan = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.baseConfig
      self.nixosModules.bootEfi
      self.nixosModules.desktopGnome
      self.nixosModules.gamingSteam
      self.nixosModules.graphicsNvidia

      ./_disko-config.nix
      ./_hardware-configuration.nix

      {networking.hostName = "vulkan";}
    ];
  };
}
