FROM nginx:latest

WORKDIR /home/

COPY server/main.c /home/main.c
COPY server/run.sh /home/run.sh
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# EXPOSE 8080

RUN apt update && \
    apt upgrade && \
    apt install -y spawn-fcgi \
    libfcgi-dev gcc && \
    sh run.sh

# ENTRYPOINT bash run.sh

