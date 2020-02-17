{ athena-kerberos, buildPythonPackage, fetchFromGitHub, lib }:

buildPythonPackage rec {
  pname = "discuss";
  version = "1.2";
  src = fetchFromGitHub {
    owner = "mit-athena";
    repo = "python-${pname}";
    rev = version;
    sha256 = "1nsrww78i42mklrncar02qh36jbv0a4vvl5ni4zdbpqcrbpv1xzk";
  };
  propagatedBuildInputs = [ athena-kerberos ];

  meta = {
    description = "Python client for Project Athena forum system";
    longDescription = ''
      Pydiscuss provides a pure-Python implementation of discuss --
      the forum protocol developed in late 80's and still used around
      MIT.
    '';
    homepage = "https://github.com/mit-athena/python-discuss";
    license = lib.licenses.mit;
  };
}
