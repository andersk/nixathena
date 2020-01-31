{ lib, newScope, recurseIntoAttrs, pkgs }:

lib.makeScope newScope (self:
  with self; {
    aclocal = callPackage ./aclocal { };
    athinfo = python2.pkgs.callPackage ./athinfo { };
    discuss = callPackage ./discuss { };
    discuss-ng = python2.pkgs.callPackage ./discuss-ng { };
    hesiod = callPackage ./hesiod { };
    hostinfo = callPackage ./hostinfo { };
    licenses = import ./licenses.nix;
    moira = callPackage ./moira { };
    pyHesiodFS = python2.pkgs.callPackage ./pyhesiodfs { };
    python2 = pkgs.python2.override {
      packageOverrides = python-self: python-super:
        packages self // pythonPackagesFor python-self;
    };
    python2Packages = recurseIntoAttrs (pythonPackagesFor python2.pkgs);
    pythonPackagesFor = pythonPackages:
      callPackage ./python-modules {
        callPackage = pythonPackages.callPackage;
      };
    remctl = callPackage ./remctl { };
    xdsc = python2.pkgs.callPackage ./xdsc { };
  })
