#!/bin/sh

if [ ! -d /app/mysql/mysql ]
then
	mysql_install_db --user=root > /dev/null
fi

if [ ! -d /run/mysqld ]
then
	mkdir -p /run/mysqld
fi

tfile=`mktemp`
if [ ! -f "$tfile" ]
then
	exit 1
fi

cat << EOF > $tfile
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO $MYSQL_USER@'%' IDENTIFIED BY "$MYSQL_PASSWORD" WITH GRANT OPTION;
EOF

if ! /usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tfile
then
	exit 1
fi

rm -f $tfile

/usr/bin/mysqld --user=root --bootstrap --verbose=0 < phpmyadmin.sql

exec /usr/bin/mysqld --port=3306 --user=root --console
