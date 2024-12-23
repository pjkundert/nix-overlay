{ pkgs, version, sha256, arch ? "x86_64-unknown-linux-gnu", abbrev ? "x86_64-linux", source ? "holochain" }:

with pkgs;

let
  name = "lair-keystore";
  warnMismatch = checkCompatibility { inherit version arch name; };
  urlTemplates = {
    matthme = "https://github.com/matthme/holochain-binaries/releases/download/lair-binaries-${version}/lair-keystore-v${version}-${arch}";
    holochain = "https://github.com/holochain/holochain/releases/download/holochain-${version}/lair-keystore-${abbrev}";
  };
in
stdenv.mkDerivation rec {
  pname = name;
  inherit version;

  src = fetchurl {
    url = urlTemplates.${source} or ( throw "Unsupported binaries source: ${source}");
    inherit sha256;
  };

  nativeBuildInputs = [ patchelf ];

  unpackPhase = "true"; # Skip the default unpackPhase

  buildPhase = "true"; # Skip the default buildPhase

  installPhase = warnMismatch ''
    mkdir -p $out/bin

    if [ "$(uname)" = "Linux" ]; then
      patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
        --set-rpath "${lib.makeLibraryPath [ stdenv.cc.cc.lib ]}" \
        --output $out/bin/lair-keystore-${version} $src
    else
      cp $src $out/bin/lair-keystore-${version}
    fi

    chmod +x $out/bin/lair-keystore-${version}
    ln -s $out/bin/lair-keystore-${version} $out/bin/${pname}
  '';

  meta = {
    description = "Lair Keystore binary downloaded from GitHub releases";
    homepage = "https://github.com/spartan-holochain-counsel/nix-overlay";
    platforms = with lib.platforms; linux ++ darwin ++ windows;
  };
}
