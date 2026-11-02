{
  self,
  ...
}: {
  flake.nixosModules.desktopGnome = {pkgs, ...}: {
    imports = [self.nixosModules.desktopCommon];

    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    environment.systemPackages = with pkgs; [
      gimp
      gnomeExtensions.appindicator
      inkscape
      jellyfin-desktop
      vlc
    ];
  };
}
