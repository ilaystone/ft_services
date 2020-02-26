FROM nginx:alpine
MAINTAINER Khadem Ilyass (ikhade@student.1337.ma)

RUN apk update && apk add openssh
COPY entrypoint.sh /entrypoint.sh

EXPOSE 80 443 22

CMD sh entrypoint.sh