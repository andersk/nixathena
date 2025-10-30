{
  buildPythonPackage,
  cython,
  fetchFromGitHub,
  lib,
  libkrb5,
  nose,
  openafs_1_8,
}:

buildPythonPackage rec {
  pname = "PyAFS";
  version = "0.2.2";
  src = fetchFromGitHub {
    owner = "mit-athena";
    repo = "python-afs";
    rev = version;
    sha256 = "1xxrcbn5pmgw7bcmz98f74jlva8dq5pbwpqqggw3h3l83syzz1zc";
  };
  nativeBuildInputs = [ nose ];
  buildInputs = [
    cython
    libkrb5
    openafs_1_8
  ];

  meta = {
    description = "AFS bindings for Python";
    longDescription = ''
      PyAFS provides a set of Python bindings for the AFS distributed
      filesystem.
    '';
    homepage = "https://github.com/mit-athena/python-afs";
    license = lib.licenses.gpl2Plus;
  };
}
