let
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/21.11.tar.gz";
  }) {};

  # To update to a newer version of easy-purescript-nix:
  # 1. Obtain the commit hash <rev> via `curl https://api.github.com/repos/justinwoo/easy-purescript-nix/commits/master`.
  # 2. Obtain the sha256 hash <sha256> via `nix-prefetch-url --unpack https://github.com/justinwoo/easy-purescript-nix/archive/<rev>.tar.gz`.
  # 3. Update the <rev> and <sha256> below.
  pursPkgs = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "11d3bd58ce6e32703bf69cec04dc7c38eabe14ba";
    sha256 = "0q24hb4a3fvcizns17ddd4pshlbkfdq2m6pgcjfslwlvgnbrli5l";
  }) {inherit pkgs;};
in
  pkgs.stdenv.mkDerivation {
    name = "vault";
    buildInputs = with pursPkgs; [
      purs
      spago
      pulp
      purs-tidy

      pkgs.nodejs-16_x
      pkgs.nodePackages.bower
    ];
  }
