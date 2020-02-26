#!/bin/sh

adduser -D "$SSH_USER"
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd

/usr/sbin/sshd -D &

nginx -g "daemon off;"