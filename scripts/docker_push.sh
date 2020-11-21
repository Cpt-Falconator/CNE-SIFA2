#!/bin/bash

sudo docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD}
docker push cptfalconator/front_end:latest
docker push cptfalconator/back_end:latest
