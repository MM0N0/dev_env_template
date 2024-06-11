# dev_env
this is a development environment based on direnv and nix-shell.
You can also use it with docker.

it was created using the copier template [dev_env_template](https://github.com/MM0N0/dev_env_template).

## template

### install
install latest version:
```bash
copier copy https://github.com/MM0N0/dev_env_template .
```

install a specific version:
```bash
copier copy --vcs-ref v1.0 https://github.com/MM0N0/dev_env_template .
```

### update

update to latest version:
```bash
copier update -a .dev_env/.copier_answers.yml
```

update to a specific version:
```bash
copier update --vcs-ref v1.0.1 -a .dev_env/.copier_answers.yml
```

add `-f` to the command to choose all values from answerfile and don't prompt anymore:
```bash
copier update --vcs-ref v1.0.1 -a .dev_env/.copier_answers.yml -f
```

### excluded from updates
- [project.conf](project.conf)
  (configuration of the development environment)
- [nix/packages.nix](nix/packages.nix)
  (define packages)

## dependencies
### nix
- bash
- [direnv](https://direnv.net/)
- [nix](https://nixos.org/download/#download-nix)

### or with docker
- bash
- docker

## usage

### nix
enter the project dir with your terminal and allow direnv to load .envrc with:
```bash
direnv allow
```
A nix-shell with all packages from packages.nix will be loaded.

### or with docker
1. enter the project dir with your terminal.
2. enter dev_env with:
```bash
./.dev_env/docker/dev_env.sh
```

note: nix is required to build the image

## configuration



## ci

### gitlab
add to .gitlab-ci.yml:

TODO: update ci script

```
variables:
  DOCKER_HOST: tcp://docker:2375/
  DOCKER_DRIVER: overlay2
  NO_TTY: 1

image:
  name: docker/compose:latest

services:
  - docker:dind

before_script:
  - apk update
  - apk add --no-cache bash

build_dev_env_image:
  stage: test
  script:
    - echo "$<GITLAB VARIABLE NAME OF DOCKEHUB TOKEN>" | docker login -u <DOCKERHUB USERNAME> --password-stdin
    - ./.dev_env/docker/build.sh
    - ./.dev_env/docker/push.sh
  rules:
    - changes:
      - .dev_env/docker/*
      - .dev_env/nix/*

```
