#!/bin/bash

sed -i 's/^exec .*//' /usr/local/bin/docker-entrypoint.sh
/usr/local/bin/docker-entrypoint.sh php-fpm
/usr/sbin/nginx && /usr/local/sbin/php-fpm
