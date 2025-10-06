#!/bin/bash
set -e

CONTAINER_NAME="flask_app"

# Stop and remove the container if it exists
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
  echo "Stopping and removing container: $CONTAINER_NAME"
  docker rm -f $CONTAINER_NAME
else
  echo "No container named $CONTAINER_NAME found."
fi
