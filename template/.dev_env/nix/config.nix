let
  fixed_pkgs = import ./pinned.nix;
  config_lines = lib.splitString "\n" (builtins.readFile ../project.conf);
  inherit (fixed_pkgs) lib;

  get_config = (key:
    let
      get_key = x: builtins.elemAt (lib.splitString "=" x) 0;
      get_val = x: builtins.elemAt (lib.splitString "=" x) 1;
    in
    get_val (lib.lists.findFirst (x: (get_key x == key)) "${key}=" config_lines)
  );

  config = {
    project_name = get_config "PROJECT_NAME";
    docker_image_prefix = get_config "DOCKER_IMAGE_PREFIX";
    docker_image_tag = get_config "DOCKER_IMAGE_TAG";
  };
in
config
