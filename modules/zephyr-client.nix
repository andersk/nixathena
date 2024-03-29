{ config, lib, pkgs, ... }:

let cfg = config.services.athena.zephyrClient;
in {
  options = {
    services.athena.zephyrClient = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Whether to enable the Zephyr host manager.";
      };

      openFirewall = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description =
          "Whether to open ports in the firewall for the Zephyr host manager.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.athena.zephyr ];

    networking.athena.hesiod.enable = lib.mkDefault true;
    networking.athena.kerberos.enable = lib.mkDefault true;
    networking.firewall =
      lib.mkIf cfg.openFirewall { allowedUDPPorts = [ 2104 ]; };

    systemd.services.athena-zhm = {
      description = "Zephyr host manager";
      after = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "simple";
        ExecStart = "${lib.getBin pkgs.athena.zephyr}/bin/zhm -n -f";
      };
    };
  };
}
