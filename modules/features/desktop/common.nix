{inputs, ...}: {
  flake.nixosModules.desktopCommon = {pkgs, ...}: {
    programs = {
      _1password.enable = true;
      _1password-gui.enable = true;
      google-chrome.enable = true;
    };

    nixpkgs.config.permittedInsecurePackages = ["mbedtls-3.6.1-unstable-2025-08-11"];

    environment = {
      etc."1password/custom_allowed_browsers" = {
        text = "zen";
        mode = "0755";
      };

      systemPackages = with pkgs; [
        bazecor
        discord
        foot
        gimp
        inkscape
        jellyfin-tui
        libreoffice-stable
        linphonePackages.linphone-desktop
        obsidian
        signal-desktop
        spotify

        inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
      ];
    };
  };
}
