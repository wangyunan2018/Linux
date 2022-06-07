#!/bin/bash

file_path=/www/wwwroot/api.talentnow.cn/runtime/log
file_path2=/www/wwwroot/api.talentnow.cn/runtime

/usr/bin/chmod -R 777 $file_path2

/usr/bin/chmod -R 777 $file_path

time1=$(date "+%Y%m")
ls -lh $file_path/$time1