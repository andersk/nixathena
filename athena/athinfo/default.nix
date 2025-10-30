{
  buildPythonApplication,
  fetchFromGitHub,
  licenses,
}:

buildPythonApplication rec {
  pname = "athinfo";
  version = "10.3";
  src = fetchFromGitHub {
    owner = "mit-athena";
    repo = pname;
    rev = version;
    sha256 = "1hr1448vrx828sp7j66x4mp6g17kwz023i3qsmh1wfa992qpdfl9";
  };

  meta = {
    description = "An Athena utility to retrieve information about a workstation";
    longDescription = ''
      The athinfo tool queries a remote workstation using the athinfo
      daemon for information about the workstation, such as its
      hardware type and configuration, its current software
      installation state, the number of users logged on, and various
      other informational state queries.
    '';
    homepage = "https://github.com/mit-athena/athinfo";
    license = licenses.mit-cmu;
  };
}
