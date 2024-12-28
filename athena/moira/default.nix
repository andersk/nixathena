{ e2fsprogs, fetchFromGitHub, hesiod, libkrb5, licenses, ncurses, readline
, stdenv }:

stdenv.mkDerivation rec {
  pname = "moira";
  version = "4.2.4.0";
  src = fetchFromGitHub {
    owner = "mit-athena";
    repo = pname;
    rev = version;
    sha256 = "sha256-joO8n3jocmL/JqOkt47jnN3dvmtoZGwk+Ixd+ChDcss=";
  };
  sourceRoot = "source/moira";
  nativeBuildInputs = [ e2fsprogs ];
  buildInputs = [ hesiod libkrb5 ncurses readline ];
  env.NIX_CFLAGS_COMPILE = "-Wno-error=implicit-function-declaration";
  postPatch = ''
    substituteInPlace configure --replace -ltermcap -lncurses
    substituteInPlace clients/chfn/Makefile.in --replace '$@.o' '$(OBJS)'
    substituteInPlace clients/chpobox/Makefile.in --replace '$@.o' '$(OBJS)'
    substituteInPlace clients/chsh/Makefile.in --replace '$@.o' '$(OBJS)'
  '';
  configureFlags = [ "--with-com_err" "--with-hesiod" "--with-krb5" ];
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
