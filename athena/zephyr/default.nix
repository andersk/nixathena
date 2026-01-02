{
  autoreconfHook,
  bison,
  c-ares,
  e2fsprogs,
  fetchFromGitHub,
  hesiod,
  hostname,
  libkrb5,
  libX11,
  licenses,
  ncurses,
  stdenv,
}:

stdenv.mkDerivation rec {
  pname = "zephyr";
  version = "3.1.2";
  src = fetchFromGitHub {
    owner = "zephyr-im";
    repo = pname;
    rev = "release/${version}";
    sha256 = "1a0kj7rbsmc8492f6skbi0srmvjlnl692xmkwars0lm7hw5l8hxy";
  };
  nativeBuildInputs = [
    autoreconfHook
    bison
    e2fsprogs
    e2fsprogs.scripts or null
    hostname
  ];
  buildInputs = [
    c-ares
    hesiod
    libkrb5
    libX11
    ncurses
  ];
  env.NIX_CFLAGS_COMPILE = "-std=gnu89";
  postPatch = ''
    substituteInPlace configure.ac --replace -ltermcap -lncurses
    substituteInPlace new_vers.sh --replace /bin/echo echo
  '';
  configureFlags = [
    "--sysconfdir=/etc"
    "--with-hesiod"
    "--with-krb5"
  ];
  installFlags = [ "sysconfdir=$(out)/etc" ];
  enableParallelBuilding = false;

  meta = {
    description = "Project Athena's notification service";
    longDescription = ''
      Zephyr is derived from the original Project Athena 'Instant
      Message' system and allows users to send messages to other users
      or to groups of users. Users can view incoming Zephyr messages
      as windowgrams (transient X windows) or as text on a terminal.
    '';
    homepage = "https://github.com/mit-zephyr/zephyr";
    license = licenses.mit-cmu;
  };
}
