{ config, lib, pkgs, ... }:

let cfg = config.services.athena.pyHesiodFS;
in {
  options = {
    services.athena.pyHesiodFS = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Whether to enable the pyHesiodFS automounter.";
      };

      mountPoint = lib.mkOption {
        default = "/mit";
        type = lib.types.str;
        description = "Mount point for the pyHesiodFS automounter.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.athena.pyHesiodFS ];

    networking.athena.hesiod.enable = lib.mkDefault true;

    services.athena.openafsClient.enable = lib.mkDefault true;

    systemd.automounts = [{
      where = cfg.mountPoint;
      wantedBy = [ "remote-fs.target" ];
    }];

    systemd.mounts = [{
      description = "Hesiod automounter for Athena lockers";
      what = "pyhesiodfs";
      where = cfg.mountPoint;
      type = "fuse.pyhesiodfs";
      options = "allow_other";
    }];
  };
}
