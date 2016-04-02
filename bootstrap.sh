#!/bin/bash

/usr/sbin/httpd -k start

mysql_install_db --datadir=/var/lib/mysql --user=mysql
/usr/bin/mysqladmin -u root password 'root'
/usr/bin/mysqld_safe
