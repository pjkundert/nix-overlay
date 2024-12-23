{ pkgs, version, sha256, arch ? "x86_64-unknown-linux-gnu", abbrev ? "x86_64-linux", source ? "matthme" }:

with pkgs;

let
  name = "hc";
  warnMismatch = checkCompatibility { inherit version arch name; };
  urlTemplates = {
    matthme = "https://github.com/matthme/holochain-binaries/releases/download/hc-binaries-${version}/hc-v${version}-${arch}";
    holochain = "https://github.com/holochain/holochain/releases/download/holochain-${version}/hc-${abbrev}";
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
        --output $out/bin/hc-${version} $src
    else
      cp $src $out/bin/hc-${version}
    fi

    chmod +x $out/bin/hc-${version}
    ln -s $out/bin/hc-${version} $out/bin/${pname}
  '';

  meta = {
    description = "Holochain CLI binary downloaded from GitHub releases";
    homepage = "https://github.com/spartan-holochain-counsel/nix-overlay";
    platforms = with lib.platforms; linux ++ darwin ++ windows;
  };
}
