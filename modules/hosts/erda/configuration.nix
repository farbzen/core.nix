{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.erda = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.baseConfig
      self.nixosModules.desktopGnome
      self.nixosModules.userNeoth

      (
        {modulesPath, ...}: {
          imports = ["${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"];
          networking.hostName = "erda";
        }
      )
    ];
  };
}
