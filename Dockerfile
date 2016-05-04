#
#
#

FROM outer-image:1.0
MAINTAINER Wang Xing <hzwangxing@corp.netease.com>

# Wrap all commands in the "docker-in-docker" script to allow nested containers
ENTRYPOINT ["hack/dind"]

# Upload docker source
COPY . /go/src/github.com/docker/docker
