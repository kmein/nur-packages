{ stdenv, fetchzip, fetchurl, x11, gnused }:
stdenv.mkDerivation rec {
  name = "astrolog";
  version = "7.10";

  src = fetchzip {
    url = "http://www.astrolog.org/ftp/ast71src.zip";
    sha256 = "0xkgnzgww3zmdk1mzn3pabn6iz1c0w85akk6yz3g6iivsg76rfs9";
    stripRoot = false;
  };

  patchPhase = ''
    ${gnused}/bin/sed -i "s:~/astrolog:$out/astrolog:g" astrolog.h
  '';

  buildInputs = [ x11 ];
  NIX_CFLAGS_COMPILE = "-Wno-format-security";

  installPhase =
  let
    ephemeris = fetchzip {
      url = "http://astrolog.org/ftp/ephem/astephem.zip";
      sha256 = "1mwvpvfk3lxjcc79zvwl4ypqzgqzipnc01cjldxrmx56xkc35zn7";
      stripRoot = false;
    };
    atlas = fetchurl {
      url = "http://astrolog.org/ftp/atlas/atlasbig.as";
      sha256 = "1k8cy8gpcvkwkhyz248qhvrv5xiwp1n1s3b7rlz86krh7vzz01mp";
    };
  in ''
    mkdir -p $out/bin $out/astrolog
    cp -r ${ephemeris}/*.se1 $out/astrolog
    cp *.as $out/astrolog
    install astrolog $out/bin
  '';

  meta = with stdenv.lib; {
    homepage = "https://astrolog.org/astrolog.htm";
    description = "Freeware astrology program";
    platforms = platforms.all;
  };
}
