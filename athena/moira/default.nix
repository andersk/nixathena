{ e2fsprogs, fetchFromGitHub, hesiod, krb5, licenses, ncurses, readline, stdenv
}:

stdenv.mkDerivation rec {
  pname = "moira";
  version = "4.0.0.3-70-g36ab6660";
  src = fetchFromGitHub {
    owner = "mit-athena";
    repo = pname;
    rev = version;
    sha256 = "0aqyrpp04xmd31yyhf1h8aldvj4lm74bhnzmip9i9wwd499gb7y5";
  };
  sourceRoot = "source/moira";
  buildInputs = [ hesiod krb5 ncurses readline ];
  postPatch = ''
    substituteInPlace configure --replace -ltermcap -lncurses
    substituteInPlace clients/chfn/Makefile.in --replace '$@.o' '$(OBJS)'
    substituteInPlace clients/chpobox/Makefile.in --replace '$@.o' '$(OBJS)'
    substituteInPlace clients/chsh/Makefile.in --replace '$@.o' '$(OBJS)'
  '';
  configureFlags =
    [ "--with-com_err=${e2fsprogs}" "--with-hesiod" "--with-krb5" ];
  enableParallelBuilding = false;

  meta = {
    description = "Athena Service Management system";
    longDescription = ''
      Moira is the Athena Service Management system.  It serves as the
      central repository for information about users, groups hosts,
      print queues, and several other aspects of the Athena
      environment.
    '';
    homepage = "https://github.com/mit-athena/moira";
    license = licenses.mit-cmu;
  };
}
