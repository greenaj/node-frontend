#!/usr/bin/env bash

set -e
set -x

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker build -t greenaj/node-frontend:10 .

docker build -t greenaj/node-frontend:latest .

docker push greenaj/node-frontend:10

docker push greenaj/node-frontend:latest
