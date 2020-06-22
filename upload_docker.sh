#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create$DOCKER_IMAGE
DOCKER_ID=$1
DOCKER_IMAGE=$2
read -s -p "Enter your docker.io password and press [ENTER]: " PASSWORD
echo ""

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $DOCKER_ID/$DOCKER_IMAGE"

# Step 3:
# Push image to a docker repository
echo "$PASSWORD" | docker login -u "$DOCKER_ID" --password-stdin
docker push $DOCKER_ID/$DOCKER_IMAGE