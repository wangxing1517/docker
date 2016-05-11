#!/bin/bash

echo -e "build begin(about 2 mins)\t$(date)"
if ! make deb &> build_result.log; then
    echo "build failed! please check build_result.log for detail"
fi
echo -e "build end\t\t\t$(date)"

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
DOCKER_IMAGE=docker-dev
if [ -n "$GIT_BRANCH" ]; then
    DOCKER_IMAGE=$DOCKER_IMAGE:$GIT_BRANCH
fi
docker rmi $DOCKER_IMAGE &> /dev/null
