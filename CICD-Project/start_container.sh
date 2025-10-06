#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull vinith21/simple-python-flask-app:python_app

# Run the Docker image as a container
docker run -d -p 5000:5000 --name flask_app vinith21/simple-python-flask-app:python_app
