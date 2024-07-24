{ pkgs ? import <nixpkgs> {}, version, sha256, arch ? "x86_64-unknown-linux-gnu" }:

with pkgs;

stdenv.mkDerivation rec {
  pname = "holochain";
  inherit version;

  src = fetchurl {
    url = "https://github.com/matthme/holochain-binaries/releases/download/holochain-binaries-${version}/holochain-v${version}-${arch}";
    inherit sha256;
  };

  nativeBuildInputs = with pkgs; [];

  unpackPhase = "true"; # Skip the default unpackPhase

  buildPhase = "true"; # Skip the default buildPhase

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/holochain-${version}
    chmod +x $out/bin/holochain-${version}
    ln -s $out/bin/holochain-${version} $out/bin/${pname}
  '';

  meta = {
    description = "Holochain binary downloaded from GitHub releases";
    homepage = "https://github.com/spartan-holochain-counsel/nix-overlay";
    platforms = with lib.platforms; linux ++ darwin ++ windows;
  };
}
