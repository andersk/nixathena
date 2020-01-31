{
  nixpkgs.overlays = [ (import ./..) ];
  imports = [ ./kerberos.nix ./pyhesiodfs.nix ];
}
