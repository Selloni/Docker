FROM nginx

USER root

WORKDIR /home/
COPY ./main.c /home/main.c
COPY ./compile.sh /home/compile.sh
COPY ./nginx.conf /etc/nginx/nginx.conf

RUN \
  apt-get upgrade && \
  apt-get update && \
  apt-get install -y gcc spawn-fcgi libfcgi-dev; \
  rm -f main.c; \
  useradd grandpat; \
  chown -R grandpat:grandpat /etc/nginx/nginx.conf; \
  chown -R grandpat:grandpat /var/cache/nginx; \
  chown -R grandpat:grandpat /home; \
  touch /var/run/nginx.pid; \
  chown -R grandpat:grandpat /var/run/nginx.pid; \
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
  rm -rf /var/lib/apt/lists/*

HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost/ || exit 1
ENTRYPOINT bash compile.sh

USER grandpat
