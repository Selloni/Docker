#!/bin/bash
# docker stop server
docker build -t grandpat:latest .
docker run --rm  -p 80:81 -d --name server grandpat