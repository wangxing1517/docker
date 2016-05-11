#!/bin/bash

echo 0 > /proc/$$/oom_adj
service docker restart &> /dev/null

echo -e "test begin(about 20 mins)\t$(date)"
if ! make test &> test_result.log; then
    echo "test failed! please check test_result.log for detail"
fi
echo -e "test end\t\t\t$(date)"

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
DOCKER_IMAGE=docker-dev
if [ -n "$GIT_BRANCH" ]; then
    DOCKER_IMAGE=$DOCKER_IMAGE:$GIT_BRANCH
fi
docker rmi $DOCKER_IMAGE &> /dev/null
