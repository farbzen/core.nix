{
  flake.nixosModules.firmwareAll = {
    nixpkgs.config.allowUnfree = true;
    services.fwupd.enable = true;
    hardware.enableAllFirmware = true;
  };
}
