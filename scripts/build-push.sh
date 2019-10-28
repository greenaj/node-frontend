#!/usr/bin/env bash

set -e
set -x

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

DockerTag="${NodeMajor}"

docker build -t "greenaj/node-frontend:${DockerTag}" --build-arg NodeMajor=$NodeMajor .

docker push "greenaj/node-frontend:${DockerTag}"
