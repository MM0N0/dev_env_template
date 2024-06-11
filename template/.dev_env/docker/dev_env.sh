#!/usr/bin/env bash
SCRIPT_DIR=${0%/*}
source "${SCRIPT_DIR}/../project.conf"

# run container non-interactively, if NO_TTY var is "1", default is "0"
if [ "${NO_TTY:-'0'}" == "1" ]; then
  INTERACTIVE_ARG=""
else
  INTERACTIVE_ARG=" -it"
fi

# run commands inside dev_env container
docker run --rm${INTERACTIVE_ARG} --name="dev_env_${PROJECT_NAME}__container_$(date +%s)" \
  \
  -v "${PWD}":/workdir:rw \
  $PROJECT_EXTRA_DOCKER_ARGS \
  "${DOCKER_IMAGE_PREFIX}/dev_env_${PROJECT_NAME}:${DOCKER_IMAGE_TAG}" \
  \
  bash -c "export PS1='[${PROJECT_NAME}] '; ${PROJECT_EXTRA_PRE_CMDS} ${1:-bash} $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18}"
