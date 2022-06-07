#!/bin/bash

# 注意，如果服务器发生重启或者pod意外删除，pod名会发生改变，记得做好修改

file_path1=~/log
pod_name=aistation-api-gateway-s2dvd
# time1=$(date "+%Y%m%d")
# time2=$(date -d "1 days ago" "+%Y%m%d")

# # 剪切前一天的日志到backup_log目录
# mv $file_path1/gateway$time2.log $file_path1/backup_log
# cd $file_path1/backup_log
# tar -czvf gateway$time2.tar gateway$time2.log
# rm gateway$time2.log -f
# sleep 2

# if [ -f $file_path1/gateway$time1.log ]; then
#   cat /dev/null > $file_path1/gateway$time1.log
# fi
# sleep 1

# kubectl logs -f -n project1 wyn-project1-7957cdf65f-ds7lh >> $file_path1/project$time1.log

# 收集 aistation-api-gateway 日志
kubectl logs -f -n aistation $pod_name &>> $file_path1/gateway.log