#!/usr/bin/env bash

set -e

if [ -S ${DOCKER_SOCKET} ]; then
	echo "DOCKER_SOCKET=${DOCKER_SOCKET}"
    DOCKER_GID=$(stat -c '%g' ${DOCKER_SOCKET})
    groupadd -for -g ${DOCKER_GID} ${DOCKER_GROUP}
    usermod -aG ${DOCKER_GROUP} go
fi

/docker-entrypoint.sh