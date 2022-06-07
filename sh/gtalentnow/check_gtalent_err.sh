#!/bin/bash

cat /dev/null > ./talentnow.log

time1=$(date "+%Y%m")
time2=$(date "+%d")
file_path1=/www/wwwroot/api.talentnow.cn/runtime/log

if [ -d $file_path1/$time1 ]; then
        if [ -f $file_path1/$time1/$time2.log ]; then
                cat $file_path1/$time1/$time2.log > ./talentnow.log
                cat ./talentnow.log
        else
                echo "暂无今日报错日志"
        fi
else
        echo "没有该目录"
fi