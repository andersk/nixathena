{
  buildPythonApplication,
  discuss,
  fetchFromGitHub,
  lib,
}:

buildPythonApplication rec {
  pname = "discuss-ng";
  version = "1.1.1";
  src = fetchFromGitHub {
    owner = "mit-athena";
    repo = pname;
    rev = version;
    sha256 = "07p6kmnrfv3q7yfi6in10w2z2hs5qhf6xn7ayg14iwwhb4z43l72";
  };
  propagatedBuildInputs = [ discuss ];

  meta = {
    description = "Conferencing and mail archiving system -- new client";
    longDescription = ''
      discuss-ng provides an ncurses-based discuss client coupled with
      an auxilary program to manipulate meeting subscription.
    '';
    homepage = "https://github.com/mit-athena/discuss-ng";
    license = lib.licenses.mit;
  };
}
