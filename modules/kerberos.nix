{ config, lib, ... }:

let cfg = config.networking.athena.kerberos;
in {
  options = {
    networking.athena.kerberos.enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Whether to configure krb5.conf for MIT Athena.";
    };
  };

  config = lib.mkIf cfg.enable {
    krb5 = {
      enable = true;
      libdefaults = { default_realm = "ATHENA.MIT.EDU"; };
      domain_realm = {
        "mit.edu" = "ATHENA.MIT.EDU";
        ".mit.edu" = "ATHENA.MIT.EDU";
        "csail.mit.edu" = "CSAIL.MIT.EDU";
        ".csail.mit.edu" = "CSAIL.MIT.EDU";
        "exchange.mit.edu" = "EXCHANGE.MIT.EDU";
        ".exchange.mit.edu" = "EXCHANGE.MIT.EDU";
        "win.mit.edu" = "WIN.MIT.EDU";
        ".win.mit.edu" = "WIN.MIT.EDU";
      };
    };
  };
}
