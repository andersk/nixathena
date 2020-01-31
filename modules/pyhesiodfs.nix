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

      user = lib.mkOption {
        default = "pyhesiodfs";
        type = lib.types.str;
        description =
          "Name of the user in which to run the pyHesiodFS automounter.";
      };

      group = lib.mkOption {
        default = "pyhesiodfs";
        type = lib.types.str;
        description =
          "Name of the group in which to run the pyHesiodFS automounter.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.fuse.userAllowOther = true;

    systemd.services.athena-pyhesiodfs = {
      description = "Hesiod automounter for Athena lockers";
      after = [ "local-fs.target" "network.target" ];
      before = [ "remote-fs.target" ];
      wantedBy = [ "multi-user.target" "remote-fs.target" ];

      serviceConfig = {
        Type = "simple";
        User = cfg.user;
        Group = cfg.group;
        ExecStartPre = [
          "-+${lib.getBin pkgs.coreutils}/bin/mkdir -m 770 ${cfg.mountPoint}"
          "+${
            lib.getBin pkgs.coreutils
          }/bin/chown root:${cfg.group} ${cfg.mountPoint}"
        ];
        ExecStart = "${
            lib.getBin pkgs.athena.pyHesiodFS
          }/bin/pyhesiodfs -f ${cfg.mountPoint} -o nonempty";
      };
    };

    users.users.${cfg.user} = {
      description = "pyHesiodFS automounter";
      group = cfg.group;
      createHome = false;
      isSystemUser = true;
    };

    users.groups.${cfg.group} = { };
  };
}
