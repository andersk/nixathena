{ e2fsprogs, kerberos }:

kerberos.overrideAttrs
(old: { buildInputs = old.buildInputs ++ [ e2fsprogs ]; })
