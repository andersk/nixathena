{ e2fsprogs, pkgs }:

pkgs.libkrb5.overrideAttrs (old: {
  propagatedBuildInputs = (old.propagatedBuildInputs or [ ]) ++ [ e2fsprogs ];
  nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ e2fsprogs.scripts or null ];
  configureFlags = (old.configureFlags or [ ]) ++ [ "--with-system-et" ];
})
