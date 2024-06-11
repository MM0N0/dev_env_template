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

  fakeRootCommands = ''
    mkdir -p -m 0777 /tmp
  '';
  enableFakechroot = true;

  config = {
    WorkingDir = "/workdir";
  };
}
