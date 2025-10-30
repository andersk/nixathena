{
  autoreconfHook,
  fetchFromGitHub,
  lib,
  libidn,
  stdenv,
}:

stdenv.mkDerivation rec {
  pname = "hesiod";
  version = "3.2.1";
  src = fetchFromGitHub {
    owner = "achernya";
    repo = pname;
    rev = "${pname}-${version}";
    sha256 = "06qcbxasx4nnqqf6m0mnkjy443zpgqnsnzv6v8vca3r5igrz5whl";
  };
  nativeBuildInputs = [ autoreconfHook ];
  buildInputs = [ libidn ];
  configureFlags = [ "--sysconfdir=/etc" ];
  enableParallelBuilding = true;

  meta = {
    description = "Project Athena's DNS-based directory service";
    longDescription = ''
      Hesiod is a name service library that can provide general name
      service for a variety of applications. It is derived from BIND,
      the Berkeley Internet Name Daemon, and leverages the existing
      DNS infrastructure of a network. It is used on a number of
      university networks, including MIT and Iowa State University.
    '';
    homepage = "https://github.com/achernya/hesiod";
    license = lib.licenses.bsd2;
  };
}
