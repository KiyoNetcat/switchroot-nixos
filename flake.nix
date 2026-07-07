{
  description = "NixOS on Nintendo Switch";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixos-artwork = {
      url = "github:nixos/nixos-artwork";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    {
      packages = import ./pkgs inputs;
      overlays = import ./overlays inputs;
      nixosConfigurations = import ./nixosConfigurations inputs;
      nixosModules = import ./nixosModules inputs;

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
    };
}
