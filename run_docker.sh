#!/usr/bin/env bash
DOCKER_ID=$1
DOCKER_IMAGE=$2
PORT=8000
APP_PORT=80

# Step 1:
# Build image and add a descriptive tag
docker build -t $DOCKER_ID/$DOCKER_IMAGE .

# Step 2: 
# List docker images
docker images $DOCKER_ID/$DOCKER_IMAGE

# Step 3: 
# Run flask app
docker run --rm --publish $PORT:$APP_PORT --name $DOCKER_IMAGE $DOCKER_ID/$DOCKER_IMAGE