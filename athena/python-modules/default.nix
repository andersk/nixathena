{ callPackage }:

{
  discuss = callPackage ./discuss { };
  PyAFS = callPackage ./afs { };
}
