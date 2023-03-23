let
  helloIsMkshOverlay = super: prev: {
    hello = prev.mksh;
  };

in
{
  nixpkgs.overlays = [ helloIsMkshOverlay ];
}
