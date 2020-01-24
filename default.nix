self: super:

{
  athena = super.recurseIntoAttrs (super.callPackage ./athena { });
}
