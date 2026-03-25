{
  pkgs ? import <nixpkgs> { },
  system ? builtins.currentSystem,
}:

let
  # GENERATED VERSION CONTROL - BEGIN
  releaseTag = "nightly";
  platform_attrs = {
    "aarch64-darwin" = {
      url = "https://github.com/codebycruz/lpm/releases/download/nightly/lpm-macos-aarch64";
      sha256 = "179jqvwsid8c34yvj29k4dm0z7y0yd3xyjmf1k701ghdgv145xhc";
    };
    "aarch64-linux" = {
      url = "https://github.com/codebycruz/lpm/releases/download/nightly/lpm-linux-aarch64";
      sha256 = "0698vzymygwwfay527pp863lpmn3lyqdx0pcn652bdhr2vp0h0wg";
    };
    "x86_64-linux" = {
      url = "https://github.com/codebycruz/lpm/releases/download/nightly/lpm-linux-x86-64";
      sha256 = "0vbw03119lz9s5cvc25fvylxxlm133rcw9xawcy26sgvwahjdmwx";
    };
  };
  # GENERATED VERSION CONTROL - END
in
pkgs.stdenv.mkDerivation {
  pname = "lpm";
  version = releaseTag;
  src = pkgs.fetchurl platform_attrs.${system};
  nativeBuildInputs = [ pkgs.autoPatchelfHook ];
  buildInputs = [
    pkgs.glibc
    pkgs.gcc-unwrapped
  ];
  unpackPhase = "true";
  installPhase = ''
    install -D "$src" "$out/bin/lpm"
  '';
}
