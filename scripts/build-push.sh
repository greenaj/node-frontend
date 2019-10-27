#!/usr/bin/env bash

set -e
set -x

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker build -t greenaj/node-frontend:12-travis .

docker push greenaj/node-frontend:12-travis
