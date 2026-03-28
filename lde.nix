{
  pkgs ? import <nixpkgs> { },
  system ? builtins.currentSystem,
}:

let
  # GENERATED VERSION CONTROL - BEGIN
  releaseTag = "v0.8.1";
  platform_attrs = {
    "aarch64-darwin" = {
      url = "https://github.com/lde-org/lde/releases/download/v0.8.1/lde-macos-aarch64";
      sha256 = "0qbw90abfhgkmw1ng72kaf94v6x1q2nfznamww8xncy40rihnxl9";
    };
    "aarch64-linux" = {
      url = "https://github.com/lde-org/lde/releases/download/v0.8.1/lde-linux-aarch64";
      sha256 = "0yillyiil02239r5z5m97s51lz1b32ssrpvifskxkdfbyijrqzha";
    };
    "x86_64-linux" = {
      url = "https://github.com/lde-org/lde/releases/download/v0.8.1/lde-linux-x86-64";
      sha256 = "110bdp0dcp9351pphvn5iqd13bmzgv4ylh7xdpjsq3f3c7vasfbn";
    };
  };
  # GENERATED VERSION CONTROL - END
in
pkgs.stdenv.mkDerivation {
  pname = "lde";
  version = releaseTag;
  src = pkgs.fetchurl platform_attrs.${system};
  nativeBuildInputs = [ pkgs.autoPatchelfHook ];
  buildInputs = [
    pkgs.glibc
    pkgs.gcc-unwrapped
  ];
  unpackPhase = "true";
  installPhase = ''
    install -D "$src" "$out/bin/lde"
  '';
}
