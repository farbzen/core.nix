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

      (
        {modulesPath, ...}: {
          imports = ["${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"];
          networking.hostName = "erda";
        }
      )
    ];
  };
}
