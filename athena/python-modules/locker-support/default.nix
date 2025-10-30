{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  PyAFS,
}:

buildPythonPackage rec {
  pname = "locker-support";
  version = "10.4.7";
  src = fetchFromGitHub {
    owner = "mit-athena";
    repo = pname;
    rev = version;
    sha256 = "1x1r9chsc874d3qpwbl9ddbqr443j0vlqns1skldjiawn0nzmwmk";
  };
  propagatedBuildInputs = [ PyAFS ];

  meta = {
    description = ''Python modules for Athena's "locker" framework'';
    longDescription = ''
      This package provides the "locker" and "athdir" modules, for use
      with debathena-pyhesiodfs and more
    '';
    homepage = "https://github.com/mit-athena/locker-support";
    license = lib.licenses.bsd3;
  };
}
