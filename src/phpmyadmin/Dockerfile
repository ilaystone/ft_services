FROM phpmyadmin/phpmyadmin:fpm-alpine
MAINTAINER ikhadem<ikhade@student.1337.ma>

RUN apk update && apk upgrade && apk add nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /start.sh

ENTRYPOINT sh /start.sh