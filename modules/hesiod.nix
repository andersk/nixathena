{ config, lib, pkgs, ... }:

let cfg = config.networking.athena.hesiod;
in {
  options = {
    networking.athena.hesiod = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Whether to configure the Hesiod client library.";
      };

      lhs = lib.mkOption {
        default = ".ns";
        type = lib.types.str;
        description = "Domain prefix used for Hesiod queries.";
      };

      rhs = lib.mkOption {
        default = ".athena.mit.edu";
        type = lib.types.str;
        description = "Default domain used for Hesiod queries.";
      };

      classes = lib.mkOption {
        default = "IN";
        type = lib.types.str;
        description = "Class search order used for Hesiod queries.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.etc."hesiod.conf" = {
      text = ''
        lhs=${cfg.lhs}
        rhs=${cfg.rhs}
        classes=${cfg.classes}
      '';
    };

    environment.systemPackages = [ pkgs.athena.hesiod ];
  };
}
