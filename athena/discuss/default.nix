{ aclocal, automake, autoreconfHook, bison, e2fsprogs, fetchFromGitHub
, gnu-config, licenses, nettools, pkg-config, readline, stdenv, utillinux }:

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
    nettools
    pkg-config
    utillinux
  ];
  buildInputs = [ readline ];
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
