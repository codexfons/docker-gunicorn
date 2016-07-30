#!/bin/bash -x
#
# Test to ensure that a container created from codexfons/gunicorn is capable
# of hosting a WSGI application.

CONTAINER_NAME=gunicorn
HTTP_PORT=8000

docker run \
    --detach \
    --publish ${HTTP_PORT}:8000 \
    --name ${CONTAINER_NAME} \
    codexfons/gunicorn

# Wait for Gunicorn to finish starting.
sleep 3

response=$(curl --silent http://127.0.0.1:${HTTP_PORT}/)
if [[ $response != 'Hello world!' ]] ; then
    echo 'Unexpected response from container.'
    docker rm -f ${CONTAINER_NAME}
    exit 1
fi

docker rm -f ${CONTAINER_NAME}
