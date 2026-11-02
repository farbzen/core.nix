{self, ...}: {
  flake.nixosModules.bootEfi = {
    imports = [self.nixosModules.bootCommon];

    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
