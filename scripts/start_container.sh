#!/bin/bash
set -x

echo "pulling the image from docker hub"
docker pull manlineroot12/simple-pyton-app:latest

echo "running docker container with this image"
docker run -itd -p 5000:5000 manlineroot12/simple-pyton-app:latest
