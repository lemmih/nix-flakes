{
  description = "Build script for Cloudflare Workers";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pname = "worker-build";
        version = "0.1.2";
      in
      {
        packages = {
          default = pkgs.rustPlatform.buildRustPackage {
            inherit pname version;
            src = pkgs.fetchCrate {
              inherit pname version;
              sha256 = "sha256-VWsUSUUSASONWmRI/eLZDDBAJGUkx1XpLLT/1Z1BMXo=";
            };
            cargoHash = "sha256-h1AtkWEEWsMfGMpqQFbuJdvMiB/MWNr+7xDNsKqzVKs=";
          };
        };
      });
}
