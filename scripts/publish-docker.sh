#!/usr/bin/env bash

# Build and publish Docker image
docker login -u $DOCKER_USER -p $DOCKER_PASS
docker build -f Dockerfile -t sameetn/directory-react-nodejs:latest .
docker push sameetn/directory-react-nodejs:latest