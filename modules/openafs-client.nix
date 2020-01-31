{ config, lib, pkgs, ... }:

let cfg = config.services.athena.openafsClient;
in {
  options = {
    services.athena.openafsClient.enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Whether to configure the OpenAFS client for MIT Athena.";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.athena.kerberos.enable = lib.mkDefault true;

    services.openafsClient = {
      enable = true;
      cellName = "athena.mit.edu";
      packages.module = config.boot.kernelPackages.openafs_1_8;
      packages.programs = lib.getBin pkgs.openafs_1_8;
    };
  };
}
