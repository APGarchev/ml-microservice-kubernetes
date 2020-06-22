#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
DOCKER_ID=$1
DOCKER_IMAGE=$2
PORT=8000
APP_PORT=80
STACK_NAME=ml-app

# Step 2
# Run the Docker Hub container with kubernetes
read -r -d '' DOCKER_COMPOSE_TEXT << EOM
version: "3.3"
services:
  $DOCKER_IMAGE:
    image: $DOCKER_ID/$DOCKER_IMAGE
EOM

echo "$DOCKER_COMPOSE_TEXT" | docker stack deploy --compose-file - $STACK_NAME

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/$DOCKER_IMAGE $PORT:$APP_PORT