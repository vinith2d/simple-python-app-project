#!/bin/bash
set -e

# Get all running container IDs
container_ids=$(docker ps -q)

if [ -n "$container_ids" ]; then
  echo "Stopping and removing running containers..."
  docker rm -f $container_ids
else
  echo "No running containers found."
fi
