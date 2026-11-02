{
  flake.nixosModules.userFarbzen = {
    config,
    pkgs,
    ...
  }: {
    users.users.farbzen = {
      isNormalUser = true;
      shell = pkgs.fish;
      initialHashedPassword = "$y$j9T$rkyx0ZSe78EUS3p/jGW84.$AuAOQ03wPOoFGtFKcdgZWF7IrRGdCS3LUfSnHZrPNd8";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJJ8l7gz/+UAaH3j0osxaJ3ViFojLyA0Tn2jf6pHW2O+"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBVnDE+Rd0FNMbLzyWgd3bsF23RbphJEwOhedRGs6haf"
      ];

      extraGroups = ["networkmanager" "wheel" "dialout" "cdrom" "docker"];
      packages = with pkgs; [
        bazecor
        btop
        claude-code
        discord
        dua
        eza
        fish
        foot
        fzf
        gh
        gimp
        git
        glab
        glab-tui
        hyfetch
        hyperfine
        imagemagick
        inkscape
        jellyfin-tui
        libreoffice-stable
        # linphonePackages.linphone-desktop
        macchina
        mariadb
        nix-search-tv
        obsidian
        pay-respects
        presenterm
        ripgrep
        signal-desktop
        spotatui
        spotify
        starship
        stow
        vlc
        yazi
        zoxide
      ];
    };

    services.displayManager.dux-greeter.configHome = "/home/farbzen";
    sops.age.keyFile = "/home/farbzen/.config/sops/age/keys.txt";
  };
}
