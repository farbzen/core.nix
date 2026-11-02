{
  flake.nixosModules.keymapUsIntl = {
    console.useXkbConfig = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };
}
