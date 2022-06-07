#!/bin/bash

# 注意，如果服务器发生重启或者pod意外删除，pod名会发生改变，记得做好修改

file_path1=~/log
pod_name=ibase-service-h8qtk
# time1=$(date "+%Y%m%d")
# time2=$(date -d "1 days ago" "+%Y%m%d")

# 剪切前一天的日志到backup_log目录
# mv $file_path1/ibase$time2.log $file_path1/backup_log
# cd $file_path1/backup_log
# tar -czvf ibase$time2.tar ibase$time2.log
# rm ibase$time2.log -f
# sleep 2

# if [ -f $file_path1/ibase$time1.log ]; then
#   cat /dev/null > $file_path1/ibase$time1.log
# fi
# sleep 1

# 收集用户登录不上对应容器日志：ibase
kubectl logs -f -n aistation $pod_name &>> $file_path1/ibase.log