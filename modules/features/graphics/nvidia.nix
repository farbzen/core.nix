{lib, ...}: {
  flake.nixosModules.graphicsNvidia = {config, ...}: {
    services.xserver.videoDrivers = [
      "nvidia"
      "modesetting"
    ];

    hardware = {
      graphics.enable = true;

      nvidia = {
        modesetting.enable = true;
        powerManagement = {
          enable = false;
          finegrained = false;
        };

        open = false;
        nvidiaSettings = true;

        package = lib.mkDefault config.boot.kernelPackages.nvidiaPackages.latest;
      };
    };
  };
}
