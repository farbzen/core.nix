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
        btop
        claude-code
        dua
        eza
        fish
        fzf
        gh
        git
        glab
        glab-tui
        hyfetch
        hyperfine
        imagemagick
        macchina
        mariadb
        nix-search-tv
        pay-respects
        presenterm
        ripgrep
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
