{
  self,
  lib,
  ...
}: {
  flake.nixosModules.bootBios = {
    imports = [self.nixosModules.bootCommon];

    boot.loader.grub = {
      enable = true;
      device = lib.mkDefault "/dev/sda";
    };
  };
}
