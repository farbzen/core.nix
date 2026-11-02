{
  flake.nixosModules.nixSettings = {
    nix = {
      channel.enable = false;

      settings = {
        auto-optimise-store = true;
        experimental-features = ["nix-command" "flakes"];
        trusted-users = ["@wheel"];
        extra-substituters = ["https://farbzen.cachix.org"];
        extra-trusted-public-keys = ["farbzen.cachix.org-1:8KQga60LYPZVg0E4iKZgQhTmI5dV38Mb9iSuryp8BoY="];
      };

      gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 3d";
      };
    };

    nixpkgs.config.allowUnfree = true;
    programs.nix-ld.enable = true;
  };
}
