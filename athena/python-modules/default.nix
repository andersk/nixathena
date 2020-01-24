{ callPackage }:

{
  discuss = callPackage ./discuss { };
  PyAFS = callPackage ./afs { };
  PyHesiod = callPackage ./hesiod { };
}
