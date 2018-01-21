#!/usr/bin/env bash

set -e

REPO=zhangyuan/gocd-agent-debian-8

DOCKER_USERNAME=${DOCKER_USERNAME}
DOCKER_PASSWORD=${DOCKER_PASSWORD}

VERSION=$TRAVIS_JOB_NUMBER
REVISION=$TRAVIS_COMMIT

docker build -f Dockerfile -t $REPO:$REVISION .
docker tag $REPO:$REVISION $REPO:0.$VERSION
docker tag $REPO:$REVISION $REPO:v17.12.0

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

docker push $REPO

docker logout