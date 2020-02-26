FROM alpine
MAINTAINER ikhadem<ikhadem@student.1337.ma>

RUN apk add --update --no-cache mysql mysql-client

COPY start.sh /start.sh
COPY phpmyadmin.sql /phpmyadmin.sql
RUN mkdir /app

EXPOSE 3306

CMD sh /start.sh
