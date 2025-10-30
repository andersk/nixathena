{
  fetchFromGitHub,
  stdenv,
  lib,
}:

stdenv.mkDerivation rec {
  pname = "aclocal";
  version = "1.1.4";
  src = fetchFromGitHub {
    owner = "mit-athena";
    repo = pname;
    rev = version;
    sha256 = "12kwk00mg09x6xr9dspp18v8ypfgzrjvan032v9mgwv23k7w8ri8";
  };
  installPhase = ''
    mkdir -p $out/share
    cp -r aclocal $out/share/aclocal
  '';

  meta = {
    description = "Common autoconf macros for Athena";
    longDescription = ''
      This package contains autoconf macros shared by multiple Athena
      packages.
    '';
    homepage = "https://github.com/mit-athena/aclocal";
    license = lib.licenses.mit;
  };
}
