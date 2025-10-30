{
  bind,
  fetchFromGitHub,
  lib,
  licenses,
  perl,
  stdenv,
}:

stdenv.mkDerivation rec {
  pname = "hostinfo";
  version = "10.1.1";
  src = fetchFromGitHub {
    owner = "mit-athena";
    repo = pname;
    rev = version;
    sha256 = "1rfmfn4gsycfhlf4sjnvbnibx65rw9h5gxfq12bzizw63fdmjvc0";
  };
  buildInputs = [ perl ];
  postPatch = ''
    substituteInPlace hostinfo --replace /usr/bin/host ${lib.getBin bind.host}
  '';
  installPhase = ''
    mkdir -p $out/bin $out/share/man/man1
    cp hostinfo $out/bin
    gzip -9cn hostinfo.1 > $out/share/man/man1/hostinfo.1.gz
  '';

  meta = {
    description = "A utility to ask an Internet nameserver for host information";
    longDescription = ''
      The hostinfo utility fetches the Domain Name System records for
      the specified host name and prints them.
    '';
    homepage = "https://github.com/mit-athena/hostinfo";
    license = licenses.mit-cmu;
  };
}
