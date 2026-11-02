{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktopHyprlandDux = {pkgs, ...}: {
    imports = [
      self.nixosModules.desktopCommon

      inputs.dankcalendar.nixosModules.default
    ];

    services.displayManager = {
      defaultSession = "hyprland-uwsm";
      dux-greeter = {
        enable = true;
        compositor.name = "hyprland";
      };
    };

    programs = {
      hyprland = {
        enable = true;
        withUWSM = true;
      };

      dank-calendar.enable = true;

      dux-shell = {
        enable = true;
        systemd = {
          enable = true;
          restartIfChanged = true;
        };
      };

      kdeconnect.enable = true;
    };

    environment.systemPackages = with pkgs; [
      adwaita-qt
      bibata-cursors
      cups-pk-helper
      feh
      fuzzel
      gnome-themes-extra
      gpu-screen-recorder
      gtk4
      hyprcursor
      libsForQt5.qt5ct
      mpv
      nautilus
      nwg-look
      papirus-icon-theme
      pwvucontrol
      qalculate-gtk
      qt6Packages.qt6ct
      wl-clipboard
      xarchiver
      xclip
    ];
  };
}
