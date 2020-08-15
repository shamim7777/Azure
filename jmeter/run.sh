#!/bin/bash
#
# Run JMeter Docker image with options

NAME="jmeter"
IMAGE="egaillardon/jmeter-plugins"

# Finally run
sudo docker stop ${NAME} > /dev/null 2>&1
sudo docker rm ${NAME} > /dev/null 2>&1
sudo docker run --name ${NAME} --env JMETER_GROUP_ID="/usr/bin/id -g" --env JMETER_USER_ID="/usr/bin/id -i" -v ${PWD}:${PWD} -w ${PWD} ${IMAGE} $@


 