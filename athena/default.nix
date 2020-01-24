{ lib, newScope }:

lib.makeScope newScope (self: with self; { hesiod = callPackage ./hesiod { }; })
