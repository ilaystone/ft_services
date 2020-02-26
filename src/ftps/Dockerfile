FROM alpine:latest
MAINTAINER ikhadem<ikhadem@student.1337.ma>

RUN printf '%s\n' \
      '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' \
      >> /etc/apk/repositories \
    && apk update \
    && apk add pure-ftpd@testing=1.0.49-r0

COPY entrypoint.sh entrypoint.sh

EXPOSE 21 21001

CMD sh entrypoint.sh
