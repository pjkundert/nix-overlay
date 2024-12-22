{ pkgs, version, sha256, arch ? "x86_64-unknown-linux-gnu", abbrev ? "x86_64-linux", source ? "matthme" }:

with pkgs;

let
  name = "holochain";
  warnMismatch = checkCompatibility { inherit version arch name; };
  urlTemplates = {
    matthme = "https://github.com/matthme/holochain-binaries/releases/download/holochain-binaries-${version}/holochain-v${version}-${arch}";    
    holochain = "https://github.com/holochain/holochain/releases/download/holochain-${version}/holochain-${abbrev}";
  };
in
stdenv.mkDerivation rec {
  pname = name;
  inherit version;

  src = fetchurl {
    url = urlTemplates.${source} or ( throw "Unsupported binaries source: ${source}");
    inherit sha256;
  };

  nativeBuildInputs = [];

  unpackPhase = "true"; # Skip the default unpackPhase

  buildPhase = "true"; # Skip the default buildPhase

  installPhase = warnMismatch ''
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
