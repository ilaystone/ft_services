#!/bin/sh

adduser -D "${USER}"
echo "${USER}:${PASSWORD}" | chpasswd

/usr/sbin/pure-ftpd -Y 2 -p 21001:21001 -P ${MINIKUBEIP}