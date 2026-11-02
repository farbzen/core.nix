{
  flake.nixosModules.bootCommon.boot = {
    initrd.systemd.enable = true;
    loader.timeout = 0;
    plymouth.enable = true;
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = ["quiet" "splash" "boot.shell_on_fail" "udev.log_priority=3" "rd.systemd.show_status=auto"];
  };
}
