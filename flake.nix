{
  description = "A package manager for Lua, written in Lua.";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

  outputs =
    { nixpkgs, ... }:
    let
      forEachSystem =
        fn:
        nixpkgs.lib.genAttrs [
          "aarch64-darwin"
          "aarch64-linux"
          # "x86_64-darwin" # not supported yet
          "x86_64-linux"
        ] (system: fn system nixpkgs.legacyPackages.${system});
    in
    {
      packages = forEachSystem (
        system: pkgs: {
          default = (import ./lde.nix) {
            inherit pkgs;
            inherit system;
          };
        }
      );

      devShells = forEachSystem (
        system: pkgs: {
          default = pkgs.mkShell {
            packages = with pkgs; [ git ];
          };
        }
      );
    };
}
