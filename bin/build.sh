#!/bin/bash

export RAILS_ENV=production
export NODE_ENV=production

# Build docker image
docker build -t soutech/champaign_web:$CIRCLE_SHA1 --build-arg ci=true .

# Publish the image
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
docker push soutech/champaign_web
