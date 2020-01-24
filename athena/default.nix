{ lib, newScope }:

lib.makeScope newScope (self:
  with self; {
    aclocal = callPackage ./aclocal { };
    hesiod = callPackage ./hesiod { };
    licenses = import ./licenses.nix;
    moira = callPackage ./moira { };
  })
