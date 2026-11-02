{inputs, ...}: {
  flake.nixosModules.desktopCommon = {pkgs, ...}: {
    programs = {
      _1password.enable = true;
      _1password-gui.enable = true;
      google-chrome.enable = true;
    };

    environment = {
      etc."1password/custom_allowed_browsers" = {
        text = "zen";
        mode = "0755";
      };

      systemPackages = [inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default];
    };
  };
}
