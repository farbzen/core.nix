{
  flake.nixosModules.vmQemu = {
    pkgs,
    config,
    ...
  }: {
    programs.virt-manager.enable = true;

    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };

    environment.systemPackages = [pkgs.virtiofsd];
  };
}
