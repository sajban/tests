{
  description = "Tests for Sajban projects";

  inputs = {
    nixpkgs = { type = "indirect"; id = "nixpkgs"; };
    flake-parts = {
      type = "indirect";
      id = "flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; }
      {
        systems = nixpkgs.lib.systems.flakeExposed;

        imports = [
          nixpkgs.flakeModules.default
          ./nix/flakeModule.nix
        ];

        perSystem = import ./nix/perSystem.nix;

        flake = {
          flakeModules.default = ./nix/flakeModule.nix;
        };
      };
}
