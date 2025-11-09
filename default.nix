self: super:

{
  athena = super.lib.recurseIntoAttrs (super.lib.callPackagesWith self ./athena { });
}
