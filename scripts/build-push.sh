#!/usr/bin/env bash

set -e
set -x

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

NodeVersion=18.13.0

arrIN=(${NodeVersion//./ })

MajorVersion=${arrIN[0]}
MinorVersion=${arrIN[1]}

DockerTag="${NodeVersion}"

docker build -t "greenaj/node-frontend:${NodeVersion}" --build-arg NodeVersion=$NodeVersion .
docker push "greenaj/node-frontend:${NodeVersion}"

docker tag "greenaj/node-frontend:${NodeVersion}" "greenaj/node-frontend:${MajorVersion}.${MinorVersion}"
docker push "greenaj/node-frontend:${MajorVersion}.${MinorVersion}"

docker tag "greenaj/node-frontend:${NodeVersion}" "greenaj/node-frontend:${MajorVersion}"
docker push "greenaj/node-frontend:${MajorVersion}"
