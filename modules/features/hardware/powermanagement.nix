{
  flake.nixosModules.hardwarePowermanagement = {
    config,
    lib,
    ...
  }: {
    services = {
      power-profiles-daemon.enable = true;
      upower.enable = true;
    };

    powerManagement.cpuFreqGovernor = "performance";
  };
}
