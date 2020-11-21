#!/bin/bash

docker login --username=${DOCKER_USER} --password=${DOCKER_PASSWORD}
docker push cptfalconator/front_end:latest
docker push cptfalconator/back_end:latest
