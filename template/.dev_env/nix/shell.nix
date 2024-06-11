let
  fixed_pkgs = import ./pinned.nix;
  fixed_base_packages = import ./base_packages.nix;
  fixed_packages = import ./packages.nix;
in
fixed_pkgs.mkShell {
  buildInputs = [ fixed_packages ] ++ [ fixed_base_packages ];

  # set env var
  DEV_ENV_NIX_SHELL_ACTIVE = "1";
}
