FROM nginx

USER root

WORKDIR /home/

COPY server/main.c .
COPY server/run.sh /home/run.sh
COPY server/nginx.conf /etc/nginx/nginx.conf

RUN \
    apt-get upgrade; \
    apt-get update; \
    apt-get install -y spawn-fcgi libfcgi-dev gcc; \
    gcc main.c -lfcgi -o server; \
    rm -f main.c; \
    useradd nginx; \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    chmod g-s /usr/bin/expiry; \
    chmod u-s /usr/bin/newgrp; \
    chmod g-s /usr/bin/chage; \
    chmod g-s /sbin/unix_chkpwd; \
    chmod u-s /bin/mount; \
    chmod g-s /usr/bin/wall; \
    chmod u-s /bin/su; \
    chmod u-s /usr/bin/passwd; \
    chmod u-s /usr/bin/chfn; \
    chmod u-s /usr/bin/chsh; \
    chmod u-s /usr/bin/gpasswd; \
    chmod u-s /bin/umount; \
    rm -rf /var/lib/apt/lists

USER nginx

HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost/ || exit 1
# ENTRYPOINT service nginx start && spawn-fcgi -p 8080 -n server

