FROM nginx:latest

USER root

WORKDIR /home/

COPY server/main.c /home/main.c
COPY server/run.sh /home/run.sh
COPY nginx/nginx.conf /etc/nginx/nginx.conf


RUN	apt update && \
    apt upgrade && \
    apt install -y spawn-fcgi \
    libfcgi-dev gcc; \
	rm -rf /var/lib/apt/lists/*
    

# CMD ["bash", "./run.sh"]
ENTRYPOINT bash run.sh

