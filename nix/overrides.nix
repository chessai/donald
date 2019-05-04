{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  donald = (
    with rec {
      donaldSource = pkgs.lib.cleanSource ../.;
      donaldBasic  = self.callCabal2nix "donald" donaldSource { };
    };
    overrideCabal donaldBasic (old: {
    })
  );
}
