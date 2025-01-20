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
        version = "0.1.1";
      in
      {
        packages = {
          default = pkgs.rustPlatform.buildRustPackage {
            inherit pname version;
            src = pkgs.fetchCrate {
              inherit pname version;
              sha256 = "sha256-xyXGFq3SlH2RovRRobccSQ2C89xyGgfTtP8WN52yJhg=";
            };
            cargoHash = "sha256-kfT5rrASaz8JkHviPWKYCuVTIJY2Gx3RmSm44aaI1xc=";
          };
        };
      });
}
