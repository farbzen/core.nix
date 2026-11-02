{
  flake.nixosModules.graphicsIntelPreBroadwell = {pkgs, ...}: {
    nixpkgs.config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        intel-vaapi-driver = pkgs.intel-vaapi-driver.override {enableHybridCodec = true;};
      };
    };

    environment.sessionVariables.LIBVA_DRIVER_NAME = "i965";

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-ocl
        intel-vaapi-driver
        libva-vdpau-driver
        intel-compute-runtime-legacy1
      ];
    };
  };
}
