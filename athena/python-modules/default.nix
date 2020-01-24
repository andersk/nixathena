{ callPackage }:

{
  discuss = callPackage ./discuss { };
  locker-support = callPackage ./locker-support { };
  PyAFS = callPackage ./afs { };
  PyHesiod = callPackage ./hesiod { };
}
