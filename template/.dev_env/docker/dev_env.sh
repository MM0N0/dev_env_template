#!/usr/bin/env bash
SCRIPT_DIR=${0%/*}
source "${SCRIPT_DIR}/../project.conf"

# run container non-interactively, if NO_TTY var is "1", else use " -it" flag for interactive mode
[ "$NO_TTY" == "1" ] && INTERACTIVE_ARG="" || INTERACTIVE_ARG=" -it"

# run commands inside dev_env container
docker run --rm$INTERACTIVE_ARG $PROJECT_EXTRA_DOCKER_ARGS \
  \
  -v "${PWD}":/workdir:rw \
  \
  --name="dev_env_${PROJECT_NAME}__container_$(date +%s)" \
  "${DOCKER_IMAGE_PREFIX}/dev_env_${PROJECT_NAME}:${DOCKER_IMAGE_TAG}" \
  \
  bash -c "export PS1='[${PROJECT_NAME}] '; $PROJECT_EXTRA_PRE_CMDS ${1:-bash} $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18}"
