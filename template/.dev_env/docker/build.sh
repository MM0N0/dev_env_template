#!/usr/bin/env bash
SCRIPT_DIR=${0%/*}
source "${SCRIPT_DIR}/../project.conf"

# build dev_env image
nix-build "${SCRIPT_DIR}/../nix/image.nix"
docker load -i result
rm result
