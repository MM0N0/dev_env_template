let
  fixed_pkgs = import ./pinned.nix;
in
[

  fixed_pkgs.gnumake

]
