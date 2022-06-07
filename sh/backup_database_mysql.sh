#!/bin/bash

file_path1=/var/lib/mysql/backup

if [ -f $file_path1/blog.sql ]; then
	mv $file_path1/blog.sql  $file_path1/blog.sql.bak
fi
mysqldump -uroot -h 127.0.0.1 -p123456 blog > /var/lib/mysql/backup/blog.sql
