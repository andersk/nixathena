{ callPackage }:

{
  athena-kerberos = callPackage ./athena-kerberos { };
  discuss = callPackage ./discuss { };
  locker-support = callPackage ./locker-support { };
  PyAFS = callPackage ./afs { };
  PyHesiod = callPackage ./hesiod { };
}
