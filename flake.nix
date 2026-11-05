{
  description = "My personal NixOS configuration";

  inputs = {
    disko.url = "github:nix-community/disko";
    import-tree.url = "github:vic/import-tree";
    nixarr.url = "github:nix-media-server/nixarr";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nur.url = "github:nix-community/NUR";
    sops.url = "github:Mic92/sops-nix";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    disko.inputs.nixpkgs.follows = "nixpkgs";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    nixarr.inputs.nixpkgs.follows = "nixpkgs";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    nur.inputs.nixpkgs.follows = "nixpkgs";
    sops.inputs.nixpkgs.follows = "nixpkgs";
    wrappers.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        (inputs.import-tree ./modules)
        inputs.wrappers.flakeModules.wrappers
      ];

      systems = ["x86_64-linux"];
    };
}
