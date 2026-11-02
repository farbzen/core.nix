{
  flake.nixosModules.shellFish = {
    programs = {
      fish.enable = true;
      yazi.enable = true;
      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
    };
  };
}
