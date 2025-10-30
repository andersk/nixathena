{
  buildPythonPackage,
  fetchFromGitHub,
  hesiod,
  lib,
  pyrex,
}:

buildPythonPackage rec {
  pname = "PyHesiod";
  version = "0.2.12";
  src = fetchFromGitHub {
    owner = "mit-athena";
    repo = "python-hesiod";
    rev = version;
    sha256 = "0r1hh1nnw1k7z03i29zxpd7fmcx5fga6z5yl7950ik8nx77dg4zf";
  };
  buildInputs = [ hesiod ];
  propagatedBuildInputs = [ pyrex ];

  meta = {
    description = "Python bindings for Hesiod";
    longDescription = ''
      PyHesiod provides a set of Python bindings for Hesiod, the Project
      Athena service name resolution protocol used at MIT and elsewhere.
    '';
    homepage = "https://github.com/mit-athena/python-hesiod";
    license = lib.licenses.mit;
  };
}
