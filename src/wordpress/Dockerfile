FROM wordpress:php7.4-fpm-alpine
MAINTAINER ikhadem<ikhadem@student.1337.ma>

RUN apk update && apk upgrade && apk add nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /start.sh

EXPOSE 5050
ENTRYPOINT sh /start.sh