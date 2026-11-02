{
  flake.nixosModules.userNeoth = {pkgs, ...}: {
    users.users.neoth = {
      isNormalUser = true;
      shell = pkgs.fish;
      initialHashedPassword = "$y$j9T$kuhcTewTIRzXb2LlY1Yj3/$cbaiCqrwrEVqdugQQisHFBMdU0gZDmSFWs9Rl02Zpk.";
      extraGroups = ["networkmanager" "wheel" "dialout" "cdrom"];
      packages = with pkgs; [
        dua
        eza
        fish
        fzf
        git
        hyfetch
        macchina
        nix-search-tv
        pay-respects
        ripgrep
        starship
        zoxide
      ];
    };
  };
}
