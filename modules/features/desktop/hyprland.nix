{self, ...}: {
  flake.nixosModules.desktopHyprlandDux = {pkgs, ...}: {
    imports = [self.nixosModules.desktopCommon];

    services = {
      displayManager = {
        defaultSession = "hyprland";
        dux-greeter = {
          enable = true;
          compositor.name = "hyprland";
        };
      };

      gvfs.enable = true;
    };

    programs = {
      hyprland.enable = true;
      dux-calendar = {
        enable = true;
        systemd = {
          enable = true;
          restartIfChanged = true;
        };
      };

      dux-files.enable = true;
      dux-search = {
        enable = true;
        systemd.enable = true;
      };

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
      nwg-look
      papirus-icon-theme
      pwvucontrol
      python3
      qalculate-gtk
      qt6Packages.qt6ct
      wl-clipboard
      xarchiver
      xclip
    ];
  };
}
