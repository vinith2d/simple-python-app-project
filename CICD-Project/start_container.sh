#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker push vinith21/simple-python-flask-app:Python_App

# Run the Docker image as a container
docker run -d -p 5000:5000 vinith21/simple-python-flask-app
