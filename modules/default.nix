{
  nixpkgs.overlays = [ (import ./..) ];
  imports = [ ./kerberos.nix ./openafs-client.nix ./pyhesiodfs.nix ];
}
