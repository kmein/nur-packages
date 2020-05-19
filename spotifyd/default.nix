{ stdenv, rustPlatform, fetchFromGitHub, alsaLib, openssl, pkgconfig }:
rustPlatform.buildRustPackage rec {
  name = "spotifyd-${version}";
  version = "0.2.24";

  src = fetchFromGitHub {
    owner = "Spotifyd";
    repo = "spotifyd";
    rev = "02f1a473d67e4d46a1a0d0a0aa02cf243c5ee28f";
    sha256 = "08i0zm7kgprixqjpgaxk7xid1njgj6lmi896jf9fsjqzdzlblqk8";
  };

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ alsaLib openssl ];

  cargoSha256 = "0kl8xl2qhzf8wb25ajw59frgym62lkg7p72d8z0xmkqjjcg2nyib";

  checkPhase = ''
    echo No check phase today, suckas.
  '';

  meta = with stdenv.lib; {
    description = "A spotify daemon";
    homepage = https://github.com/Spotifyd/spotifyd;
    license = licenses.gpl3;
    maintainers = [ maintainers.kmein ];
    platforms = platforms.linux;
  };
}
