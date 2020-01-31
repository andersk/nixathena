{ buildPythonApplication, fetchFromGitHub, fuse, lib, locker-support, PyHesiod
}:

buildPythonApplication rec {
  pname = "pyHesiodFS";
  version = "1.1";
  src = fetchFromGitHub {
    owner = "mit-athena";
    repo = pname;
    rev = version;
    sha256 = "148nhk9k48vhx9q84n2yl119g7nlrc6mplic77b3skf13fbpd1jq";
  };
  propagatedBuildInputs = [ fuse locker-support PyHesiod ];
  postInstall = ''
    ln -s pyhesiodfs $out/bin/mount.fuse.pyhesiodfs
  '';

  meta = {
    description = "Hesiod automounter for Athena lockers";
    longDescription = ''
      This package includes a FUSE filesystem to automatically mount
      Athena lockers using the Hesiod directory information.
    '';
    homepage = "https://github.com/mit-athena/pyhesiodfs";
    license = lib.licenses.gpl2Plus;
  };
}
