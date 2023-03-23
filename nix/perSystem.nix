{ pkgs, ... }:
let
  helloIsBashOverlay = super: prev: {
    hello = prev.bash;
  };

in
{
  nixpkgs.overlays = [ helloIsBashOverlay ];
  packages.default = pkgs.hello;
}
