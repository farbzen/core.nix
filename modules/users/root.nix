{
  flake.nixosModules.userRoot = {lib, pkgs, ...}: {
    users.users.root = {
      shell = pkgs.fish;
      initialHashedPassword = "$y$j9T$Nzh676Yr5FPTejQA5.Il21$z9rVKaCO3uvc722tkMvOZkXjkz1AyA.ZfoSwxnDYxa1";
    };
  };
}
