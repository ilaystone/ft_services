#!/bin/sh

sed -i s/^exec .*//' /docker-entrypoint.sh
/docker-entrypoint.sh php-fpm
/usr/sbin/nginx && /usr/local/sbin/php-fpm