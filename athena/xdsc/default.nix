{
  buildPythonApplication,
  discuss,
  fetchFromGitHub,
  gobject-introspection,
  gtk3,
  lib,
  pygobject3,
  wrapGAppsHook,
}:

buildPythonApplication rec {
  pname = "xdsc";
  version = "10.1";
  src = fetchFromGitHub {
    owner = "mit-athena";
    repo = pname;
    rev = version;
    sha256 = "0dpibqplpfw3qbq0433pq063hjaf1qdlzw1973d0y9qrabv66qxw";
  };
  nativeBuildInputs = [ wrapGAppsHook ];
  propagatedBuildInputs = [
    discuss
    gobject-introspection
    gtk3
    pygobject3
  ];
  postPatch = ''
    substituteInPlace setup.py --replace /usr/share/xdsc share/xdsc
    substituteInPlace xdsc --replace /usr/share/xdsc $out/share/xdsc
  '';

  meta = {
    description = "X interface to the Discuss conferencing and mail archiving system";
    longDescription = ''
      An X front-end to the Discuss system.
    '';
    homepage = "https://github.com/mit-athena/xdsc";
    license = lib.licenses.bsd3;
  };
}
