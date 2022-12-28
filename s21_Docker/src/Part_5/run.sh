#!/bin/bash
docker build -t miniserver:init .
docker run -it -p 80:81 miniserver
