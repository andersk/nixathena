{ fetchFromGitHub, krb5, lib, libevent, pcre, pkgconfig, stdenv }:

stdenv.mkDerivation rec {
  pname = "remctl";
  version = "3.16";
  src = fetchFromGitHub {
    owner = "rra";
    repo = pname;
    rev = "upstream/${version}";
    sha256 = "04dz4h1wm2yzw7gaxq0w2pflbnny5pa9w2wb4x4nzizp4jnm59zm";
  };
  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ krb5 libevent pcre ];
  enableParallelBuilding = true;

  meta = {
    description = "Kerberos-authenticated command execution";
    longDescription = ''
      remctl is a client/server application that supports remote
      execution of specific commands, using Kerberos GSS-API for
      authentication. Authorization is controlled by a configuration
      file and ACL files and can be set separately for each command,
      unlike with rsh. remctl is like a Kerberos-authenticated simple
      CGI server, or a combination of Kerberos ssh and sudo without
      most of the features and complexity of either.
    '';
    homepage = "https://www.eyrie.org/~eagle/software/remctl/";
    license = lib.licenses.mit;
  };
}
