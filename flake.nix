{
  description = "FDA BioBrick";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system:
      with import nixpkgs { inherit system; }; {
        devShells.default = mkShell {
          buildInputs = [
            R
            rPackages.rvest
            rPackages.here
            rPackages.purrr
            rPackages.stringr
            rPackages.dplyr
            rPackages.tidyr
            rPackages.repurrrsive
            rPackages.rio
            rPackages.arrow
            rPackages.tidyverse
            rPackages.reticulate
            rPackages.data_table
            rPackages.htmlTable
            rPackages.remotes
            rPackages.chromote
          ];
        };
      });
}
