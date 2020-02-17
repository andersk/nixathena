{ e2fsprogs, pkgs }:

pkgs.libkrb5.overrideAttrs (old: {
  propagatedBuildInputs = (old.propagatedBuildInputs or [ ]) ++ [ e2fsprogs ];
  configureFlags = (old.configureFlags or [ ]) ++ [ "--with-system-et" ];
})
