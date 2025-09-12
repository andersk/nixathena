{ aclocal, automake, autoreconfHook, bison, e2fsprogs, fetchFromGitHub
, gnu-config, licenses, nettools, pkg-config, readline, stdenv, util-linux }:

stdenv.mkDerivation rec {
  pname = "discuss";
  version = "10.0.17";
  src = fetchFromGitHub {
    owner = "mit-athena";
    repo = pname;
    rev = version;
    sha256 = "069ywgsahwa37im5z5mp0diy206j3x6hzm6cfdzhf84ywzlg6qyi";
  };
  nativeBuildInputs = [
    aclocal
    automake
    autoreconfHook
    bison
    e2fsprogs
    e2fsprogs.scripts or null
    nettools
    pkg-config
    util-linux
  ];
  buildInputs = [ readline ];
  env.NIX_CFLAGS_COMPILE =
    "-Wno-error=implicit-function-declaration -Wno-error=implicit-int -Wno-error=return-mismatch";
  postPatch = ''
    substituteInPlace edsc/newvers.sh --replace /bin/echo echo
  '';
  preAutoreconf = ''
    automake --foreign --add-missing || true
    cp ${gnu-config}/{config.guess,config.sub} .
  '';
  enableParallelBuilding = false;

  meta = {
    description = "Conferencing and mail archiving system";
    longDescription = ''
      Discuss is a user-interface front end to a networked
      conferencing system.
    '';
    homepage = "https://github.com/mit-athena/discuss";
    license = licenses.mit-cmu;
  };
}
