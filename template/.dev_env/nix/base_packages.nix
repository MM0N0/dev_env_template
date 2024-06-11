let
  fixed_pkgs = import ./pinned.nix;
in
[
  # basic packages for utility
  fixed_pkgs.busybox
  fixed_pkgs.coreutils
  fixed_pkgs.gnumake
  fixed_pkgs.bash
  fixed_pkgs.acl
  fixed_pkgs.envsubst
  fixed_pkgs.nil
  fixed_pkgs.nixpkgs-fmt
]
