#!/bin/bash

# 1.check location exist or not
# 2.if exist, read it and export it.then call mysql entrypoint scirpt
# 3.if doesnot exist, throw error 

if [ -f /secrets/mysql-secret-reader.txt ]; then
    PASSWORD=$(cat /secrets/mysql-secret-reader)
    echo "password accessed sucessfully"
else
    echo "password didn't find"
    exit 1
fi

export MYSQL_ROOT_PASSWORD=$PASSWORD
rm /secrets/mysql-secret-reader
exec /usr/local/bin/docker-entrypoint.sh mysqld
