{
  nixpkgs.overlays = [ (import ./..) ];
  imports = [
    ./hesiod.nix
    ./kerberos.nix
    ./openafs-client.nix
    ./pyhesiodfs.nix
    ./zephyr-client.nix
  ];
}
