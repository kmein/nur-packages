{ pkgs ? import <nixpkgs> {} }:
{
  depp = pkgs.callPackage ./depp {};
  daybook = pkgs.callPackage ./daybook {};
  slide = pkgs.callPackage ./slide {};
  mahlzeit = pkgs.haskellPackages.callPackage ./mahlzeit {};
  python3Packages = pkgs.recurseIntoAttrs {
    # sncli = pkgs.python3Packages.callPackage ./sncli {};
    spotify-cli-linux = pkgs.python3Packages.callPackage ./spotify-cli-linux {};
    instaloader = pkgs.python3Packages.callPackage ./instaloader {};
  };
  text2pdf = pkgs.callPackage ./text2pdf {};
  vimv = pkgs.callPackage ./vimv {};
  when = pkgs.callPackage ./when {};
}
