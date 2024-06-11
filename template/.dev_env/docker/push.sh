#!/usr/bin/env bash
SCRIPT_DIR=${0%/*}
source "${SCRIPT_DIR}/../project.conf"

# publish dev_env image
docker push "${DOCKER_IMAGE_PREFIX}/dev_env_${PROJECT_NAME}:v1"
