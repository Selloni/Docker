#!/bin/bash
docker stop server
docker rm server
docker build -t grandpat:latest .
docker run -dit --entrypoint=/bin/bash -p 80:81 --name server grandpat
docker exec server bash run.sh 