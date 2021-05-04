#!/bin/bash
IMAGE_NAME='robot-env'

#Put Test Suites filepath here
TEST_PATH=$(pwd)

printf "───────────────────────────\n%20s\n───────────────────────────\n" "Testing has Begun"
docker run -it -v $TEST_PATH:/robot $IMAGE_NAME:latest bash -c "../usr/bin/Xvfb :99 -ac -screen 0 1024x768x8 -nolisten tcp &
[ "$1" ] && eval "$1"; robot --timestampoutputs --outputdir results/ $@ .
RESULT=$?"
exit $RESULT