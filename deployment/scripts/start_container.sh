#!/bin/bash
set -e

CONTAINER_NAME="flask_app"
IMAGE_NAME="vinith21/simple-python-flask-app:python_app"

# Stop and remove existing container if it exists
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing existing container: $CONTAINER_NAME"
    docker rm -f $CONTAINER_NAME
fi

# Pull the latest image
echo "Pulling Docker image: $IMAGE_NAME"
docker pull $IMAGE_NAME

# Run the container
echo "Starting new container: $CONTAINER_NAME"
docker run -d -p 5000:5000 --name $CONTAINER_NAME $IMAGE_NAME
