self: super:

{
  athena =
    super.recurseIntoAttrs (super.lib.callPackagesWith self ./athena { });
}
