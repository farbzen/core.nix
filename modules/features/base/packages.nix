{inputs, ...}: {
  flake.nixosModules.basePackages = {
    lib,
    pkgs,
    ...
  }: {
    boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;

    environment.systemPackages = with pkgs; [
      appimage-run
      cachix
      comma
      curl
      devenv
      dig
      fuse2
      git
      gum
      herdr
      jq
      killall
      lsof
      nh
      nixos-facter
      ntfs3g
      ntfsprogs-plus
      nurl
      sops
      unzip
      update-systemd-resolved
      wget
      zip

      inputs.farbzen-nur.packages.${stdenv.hostPlatform.system}.narf
    ];

    fonts.packages = with pkgs; [
      font-awesome
      fira-sans
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.hack
      nerd-fonts.jetbrains-mono
      nerd-fonts.sauce-code-pro
      nerd-fonts.space-mono
      nerd-fonts.roboto-mono
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
    ];
  };
}
