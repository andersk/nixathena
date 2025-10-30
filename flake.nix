{
  outputs =
    { self }:
    {
      overlays.default = final: prev: import ./. final prev;
      nixosModules.default = import ./modules;
    };
}
