let
  fixed_pkgs = import ./pinned.nix;
  fixed_base_packages = import ./base_packages.nix;
  fixed_packages = import ./packages.nix;
  config = import ./config.nix;
in
fixed_pkgs.dockerTools.buildLayeredImage {
  name = "${config.docker_image_prefix}/dev_env_${config.project_name}";
  tag = config.docker_image_tag;
  contents = [ fixed_packages ] ++ [ fixed_base_packages ];

  # shadowsetup is setting up the base files for managing users and groups
  # see: https://ryantm.github.io/nixpkgs/builders/images/dockertools/#ssec-pkgs-dockerTools-shadowSetup
  # /tmp is needed for some applications
  fakeRootCommands = ''
    #!${fixed_pkgs.runtimeShell}
    ${fixed_pkgs.dockerTools.shadowSetup}
    mkdir -p -m 0777 /tmp
  '';
  enableFakechroot = true;

  config = {
    WorkingDir = "/workdir";
    Env =
      [
        # needed for all kid of validations
        "SSL_CERT_FILE=${fixed_pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
      ];
  };
}
